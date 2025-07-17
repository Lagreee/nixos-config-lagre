{ inputs }:

let
   wallpapers = {
      eva = ./../../wallpapers/eva1.jpeg;
   };
   selected = "eva";
in
{
   wallpaper = wallpapers.${selected};
}
