#!/bin/sh

# ===========================
# Suckless Setup Installer
# ===========================

# Colors for verbose output
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
RESET="\033[0m"

echo -e "${YELLOW}==============================================${RESET}"
echo -e "${YELLOW}🚀 Starting Suckless Tools Installation${RESET}"
echo -e "${YELLOW}==============================================${RESET}"

# Ask sudo once
sudo -v

# ---------------------------
# 1️⃣ Install Suckless Tools
# ---------------------------
PROGRAMS="dwm dmenu slock slstatus"

for prog in $PROGRAMS; do
    echo -e "\n${YELLOW}----------------------------------------${RESET}"
    echo -e "${YELLOW}Installing $prog...${RESET}"
    echo -e "${YELLOW}----------------------------------------${RESET}"
    
    if [ -d "$prog" ]; then
        (cd "$prog" && sudo make clean install) \
            && echo -e "${GREEN}✅ $prog installation finished!${RESET}" \
            || echo -e "${RED}❌ $prog installation FAILED!${RESET}"
    else
        echo -e "${RED}⚠️ $prog not found, skipping...${RESET}"
    fi
done

echo -e "\n${GREEN}🎉 All selected suckless tools installation done!${RESET}"

# ---------------------------
# 2️⃣ Copy dunst dunstrc
# ---------------------------
DUNST_DIR="$HOME/.config/dunst"
DUNST_SRC="dunst/dunstrc"
mkdir -p "$DUNST_DIR"

echo -e "\n${YELLOW}----------------------------------------${RESET}"
echo -e "${YELLOW}Copying dunstrc...${RESET}"
echo -e "${YELLOW}----------------------------------------${RESET}"

if [ -f "$DUNST_SRC" ]; then
    if [ -f "$DUNST_DIR/dunstrc" ]; then
        mv "$DUNST_DIR/dunstrc" "$DUNST_DIR/dunstrc.bak"
        echo -e "${YELLOW}⚠️ Existing dunstrc backed up to dunstrc.bak${RESET}"
    fi
    cp "$DUNST_SRC" "$DUNST_DIR/dunstrc" \
        && echo -e "${GREEN}✅ dunstrc copied to $DUNST_DIR${RESET}" \
        || echo -e "${RED}❌ Failed to copy dunstrc${RESET}"
else
    echo -e "${RED}❌ Source dunstrc not found at $DUNST_SRC${RESET}"
fi

# ---------------------------
# 3️⃣ Copy sxhkd sxhkdrc
# ---------------------------
SXHKD_DIR="$HOME/.config/sxhkd"
SXHKD_SRC="sxhkd/sxhkdrc"
mkdir -p "$SXHKD_DIR"

echo -e "\n${YELLOW}----------------------------------------${RESET}"
echo -e "${YELLOW}Copying sxhkdrc...${RESET}"
echo -e "${YELLOW}----------------------------------------${RESET}"

if [ -f "$SXHKD_SRC" ]; then
    if [ -f "$SXHKD_DIR/sxhkdrc" ]; then
        mv "$SXHKD_DIR/sxhkdrc" "$SXHKD_DIR/sxhkdrc.bak"
        echo -e "${YELLOW}⚠️ Existing sxhkdrc backed up to sxhkdrc.bak${RESET}"
    fi
    cp "$SXHKD_SRC" "$SXHKD_DIR/sxhkdrc" \
        && echo -e "${GREEN}✅ sxhkdrc copied to $SXHKD_DIR${RESET}" \
        || echo -e "${RED}❌ Failed to copy sxhkdrc${RESET}"
else
    echo -e "${RED}❌ Source sxhkdrc not found at $SXHKD_SRC${RESET}"
fi

# ---------------------------
# 4️⃣ Copy Scripts
# ---------------------------
LOCAL_BIN="$HOME/.local/bin"
AUTO_DIR="$HOME/.config/auto"
mkdir -p "$LOCAL_BIN"
mkdir -p "$AUTO_DIR"

echo -e "\n${YELLOW}----------------------------------------${RESET}"
echo -e "${YELLOW}Copying scripts...${RESET}"
echo -e "${YELLOW}----------------------------------------${RESET}"

# dmenu-* scripts
for file in scripts/dmenu-*; do
    if [ -f "$file" ]; then
        cp "$file" "$LOCAL_BIN/"
        chmod +x "$LOCAL_BIN/$(basename $file)"
        echo -e "${GREEN}✅ Copied $(basename $file) -> $LOCAL_BIN${RESET}"
    fi
done

# .xinitrc
if [ -f "scripts/.xinitrc" ]; then
    cp "scripts/.xinitrc" "$HOME/.xinitrc"
    chmod +x "$HOME/.xinitrc"
    echo -e "${GREEN}✅ Copied .xinitrc -> $HOME${RESET}"
fi

# x11autostart.sh
if [ -f "scripts/x11autostart.sh" ]; then
    cp "scripts/x11autostart.sh" "$AUTO_DIR/"
    chmod +x "$AUTO_DIR/x11autostart.sh"
    echo -e "${GREEN}✅ Copied x11autostart.sh -> $AUTO_DIR${RESET}"
fi

echo -e "\n${GREEN}🎉 Suckless setup completed successfully!${RESET}"
