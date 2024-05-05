import { dependencies } from "lib/utils";
import options from "options";
import path from "path";
import RegularWindow from "widget/RegularWindow";
import PopupWindow, { Padding } from "widget/PopupWindow";

const { width, margin } = options.launcher;
const regexp = /^\[\[ binary data .* \]\]/;
var os = require("os");
const tmpPath = path.join(os.tmpdir(), "agscliphist-");

enum CliphistType {
  Image,
  String,
}
const currentItem = Variable(
  { id: 0, type: CliphistType.String, value: "" },
  {},
);
const cliphistList = Variable([], {});

type CliphistItem = {
  id: string;
  type: CliphistType;
  value: string;
};
const generateCliphistList = (text = "") => {
  if (!dependencies("cliphist")) {
    App.quit();
  }

  const output = Utils.exec(
    `bash -c "cliphist list | fzf --filter '${text}'" | head --lines 20`,
  ).split("\n");

  const list = output.map((i: string) => {
    const tabSplit = i.split("\t");

    const id = tabSplit[0];
    const value = tabSplit[1];
    const type = regexp.test(value) ? CliphistType.Image : CliphistType.String;

    const cliphistItem: CliphistItem = {
      id: id,
      type: type,
      value: value,
    };

    return cliphistItem;
  });

  cliphistList.setValue(list);
  currentItem.setValue(list[0]);
};

const ClipItem = (item: CliphistItem) => {
  const truncated = Widget.Label({
    class_name: "truncated",
    label: item.value,
    hexpand: true,
    max_width_chars: 30,
    xalign: 0,
    vpack: "center",
    truncate: "end",
  });

  const truncatedBox = Widget.Box({
    vertical: true,
    vpack: "center",
    children: [truncated], // TODO: fix title and description to be preview and full view
  });

  return Widget.Button({
    class_name: "cliphist-item",
    attribute: { item },
    child: truncatedBox,
    on_hover: () => currentItem.value = item,
    on_clicked: () => {
      Utils.execAsync(["bash", "-c", `cliphist decode ${item.id} | wl-copy`]);
      App.closeWindow("cliplauncher");
    },
  });
};

function preview(item: CliphistItem): Widget {
  if (item.type === CliphistType.Image) {
    const imagePath = `${tmpPath}${item.id}`;

    Utils.exec(`bash -c "cliphist decode ${item.id} > ${imagePath}"`);

    return Widget.Box({
      class_name: "preview-content",
      css: "min-width: 600px; min-height: 400px;" +
        `background-image: url("${imagePath}");` +
        "background-size: contain;" +
        "background-repeat: no-repeat;" +
        "background-position: center;",
    });
  } else {
    const fullText = Utils.exec(`cliphist decode ${item.id}`);
    return Widget.Scrollable({
      class_name: "preview-content",
      vexpand: true,
      hscroll: "never",
      css: "min-width: 600px; min-height: 400px;",
      child: Widget.Label({
        label: fullText,
        wrap: true,
        maxWidthChars: 80,
        vpack: "start",
        hpack: "start",
      }),
    });
  }
}

function Launcher() {
  const max = options.launcher.clip.max; // TODO: something max maybe

  function SeparatedClipItem(item: CliphistItem) {
    return Widget.Box(
      { vertical: true },
      Widget.Separator(),
      ClipItem(item),
    );
  }

  const listBox = Widget.Scrollable({
    vexpand: true,
    hscroll: "never",
    class_name: "cliphist-scrollable",
    css: "min-width: 300px; min-height: 400px;",
    child: Widget.Box({
      vertical: true,
      children: [],
      setup: (self) =>
        self.hook(cliphistList, () => {
          self.children = cliphistList.value.map(SeparatedClipItem);
        }),
    }),
  });

  const previewBox = Widget.Box({
    class_name: "preview",
    css: "min-width: 600px; min-height: 400px;",
    setup: (self) =>
      self.hook(currentItem, () => {
        self.child = preview(currentItem.value);
      }),
  });

  const launcherBox = Widget.Box({
    children: [listBox, previewBox],
  });

  return launcherBox;
}

function ClipLauncher() {
  const cliplauncher = Launcher();
  generateCliphistList();

  const entry = Widget.Entry({
    hexpand: true,
    on_accept: () => {
      cliplauncher.launchItem();

      App.closeWindow("cliplauncher");
      entry.text = "";
    },
    on_change: ({ text }) => generateCliphistList(text),
  });

  function focus() {
    entry.text = "";
    entry.set_position(-1);
    entry.select_region(0, -1);
    entry.grab_focus();
  }

  const layout = Widget.Box({
    css: width.bind().as((v) => `min-width: ${v}pt;`),
    class_name: "cliplauncher",
    vertical: true,
    vpack: "start",
    setup: (self) =>
      self.hook(App, (_, win, visible) => {
        if (win !== "cliplauncher") {
          return;
        }

        entry.text = "";
        if (visible) {
          focus();
        }
      }),
    children: [
      Widget.Box([entry]),
      cliplauncher,
    ],
  });

  return Widget.Box(
    { vertical: true, css: "padding: 1px" },
    Padding("cliplauncher", {
      css: margin.bind().as((v) => `min-height: ${v}pt;`),
      vexpand: false,
    }),
    layout,
  );
}

export default () =>
  // RegularWindow({
  PopupWindow({
    child: ClipLauncher(),
    name: "cliplauncher",
    layout: "top",
  });
