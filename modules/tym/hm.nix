{ config, lib, ... }:

{
  options.stylix.targets.tym.enable =
    config.lib.stylix.mkEnableTarget "Tym" true;

  config = lib.mkIf config.stylix.targets.tym.enable {
    xdg.configFile."tym/theme.lua" = {
      text = with config.lib.stylix.colors.withHashtag; ''
local bg = '${base00}'
local fg = '${base05}'
return {
  color_background = bg,
  color_foreground = fg,
  color_bold = fg,
  color_cursor = fg,
  color_cursor_foreground = bg,
  color_highlight = fg,
  color_highlight_foreground = bg,
  color_0  = bg,
  color_1  = '${base08}',
  color_2  = '${base0B}',
  color_3  = '${base0A}',
  color_4  = '${base0D}',
  color_5  = '${base0E}',
  color_6  = '${base0C}',
  color_7  = fg,
  color_8  = '${base03}',
  color_9  = '${base09}',
  color_10 = '${base01}',
  color_11 = '${base02}',
  color_12 = '${base04}',
  color_13 = '${base06}',
  color_14 = '${base0F}',
  color_15 = '${base07}',
}
    '';
    onChange = ''
      dbus-send /me/endaaman/tym0 me.endaaman.tym.hook string:'reload_theme'
    '';
  };
}
