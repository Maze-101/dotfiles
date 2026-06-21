#!/bin/bash

# Directory where recordings will be saved
REC_DIR="$HOME/videos"

# Timestamp format for unique filenames
FILENAME="$REC_DIR/recording_$(date +%m-%d).mp4"

# Check if ffmpeg screen recording is already running
if pgrep -x "ffmpeg" > /dev/null; then
    # Send SIGINT (Ctrl+C equivalent) so ffmpeg closes the container properly
    pkill -2 -x "ffmpeg"
    notify-send "Screen Recording" "Recording saved successfully."
    exit 0
fi

# Prompt user for audio choice using dmenu
CHOICE=$(echo -e "No Audio\nWith Audio" | dmenu -i -p "Screen Record:")

# Exit if user hits Escape/cancels dmenu
if [ -z "$CHOICE" ]; then
    exit 1
fi

# Start recording based on choice
case "$CHOICE" in
    "No Audio")
        notify-send "Screen Recording" "Started (No Audio) at 720p60"
        ffmpeg -f x11grab -video_size 1920x1080 -framerate 60 -i :0.0 \
               -c:v libx264 -preset ultrafast -crf 22 "$FILENAME" &
        ;;
    "With Audio")
        notify-send "Screen Recording" "Started (With Audio) at 720p60"
        ffmpeg -f x11grab -video_size 1920x1080 -framerate 60 -i :0.0 \
               -f pulse -ac 2 -i default \
               -c:v libx264 -preset ultrafast -crf 22 -c:a aac "$FILENAME" &
        ;;
    *)
        exit 1
        ;;
esac
