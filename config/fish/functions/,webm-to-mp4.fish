function ,webm-to-mp4
    ffmpeg -i $argv[1] -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p (path change-extension mp4 $argv[1])
end
