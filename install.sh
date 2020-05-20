#!/bin/sh
sdl2_link="https://www.libsdl.org/release/SDL2-2.0.12.zip"
sdl_image_link="https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.5.zip"
sdl_mixer_link="https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-2.0.4.zip"
#sdl_ttf_link="https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.15.zip"
#free_type_link="https://git.savannah.gnu.org/cgit/freetype/freetype2.git/snapshot/freetype2-VER-2-10-2.tar.gz"

lib_folder="SDL"

sdl2_arch_name="SDL2.zip"
sdl_image_arch_name="SDL_image.zip"
sdl_mixer_arch_name="SDL_mixer.zip"
#sdl_ttf_arch_name="SDL_ttf.zip"
#free_type_arch_name="FreeType.tar.gz"

#If the folder exists, delete it.
if [[ -n $(ls | grep -i $lib_folder) ]]; then
	rm -r $lib_folder
fi

#download SDL2 framework
curl $sdl2_link --create-dirs -o $lib_folder/$sdl2_arch_name

#download SDL_image framework
curl $sdl_image_link --create-dirs -o $lib_folder/$sdl_image_arch_name

#download SDL_mixer framework
curl $sdl_mixer_link --create-dirs -o $lib_folder/$sdl_mixer_arch_name

#download SDL_ttf framework
#curl $sdl_ttf_link --create-dirs -o $lib_folder/$sdl_ttf_arch_name

#download FreeType
#curl $free_type_link --create-dirs -o $lib_folder/$free_type_arch_name

unzip $lib_folder/$sdl2_arch_name -d $lib_folder/
unzip $lib_folder/$sdl_image_arch_name -d $lib_folder/
unzip $lib_folder/$sdl_mixer_arch_name -d $lib_folder/
#unzip $lib_folder/$sdl_ttf_arch_name -d $lib_folder/
#tar -C ./$lib_folder/ -xzvf $lib_folder/$free_type_arch_name

cd $lib_folder
pwd
sh SDL2-2.0.12/configure && make && make install
sh SDL2_image-2.0.5/configure && make && make install
sh SDL2_mixer-2.0.4/configure && make && make install
#cd freetype2-VER-2-10-2/ sh freetype2-VER-2-10-2/autogen.sh && make setup ansi && make 
#sh SDL2_ttf-2.0.15/configure && make && make install

#Delete arch files
rm -f $lib_folder/$sdl2_arch_name
rm -f $lib_folder/$sdl_image_arch_name
rm -f $lib_folder/$sdl_mixer_arch_name
#rm -f $lib_folder/$sdl_ttf_arch_name
