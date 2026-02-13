#!/bin/bash

# MASSIVE CLAUDE W

# Check if wf-recorder is running
if pgrep -x wf-recorder > /dev/null; then
    # Stop recording
    pkill -SIGINT wf-recorder
    
    # Wait a moment for the file to be written
    sleep 1
    
    # Find the most recent .mkv file
    LAST=$(ls -t "$HOME/media/recordings/mkv/"*.mkv 2>/dev/null | head -n1)
    
    if [ -n "$LAST" ]; then
        # Convert to mp4
        LAST_MP4="$HOME/media/recordings/$(basename "$LAST" .mkv).mp4"
        ffmpeg -i "$LAST" -vcodec libx264 -crf 28 -preset slow -acodec aac -b:a 128k "$LAST_MP4"
        
        # Open in thunar and copy path
        thunar "$LAST_MP4" &
        printf "%s" "$LAST_MP4" | wl-copy
    fi
else
    # Start recording
    mkdir -p "$HOME/media/recordings/mkv"
    LAST="$HOME/media/recordings/mkv/$(date +'%H:%M:%S').mkv"
    wf-recorder -y -g "$(slurp)" -f "$LAST"
fi
