from PIL import Image, ImageDraw
import os
import shutil

artifact_dir = r"C:\Users\pc\.gemini\antigravity\brain\6059564e-75a8-4e24-ba56-345c62707970"
assets_dir = r"c:\Users\pc\Documents\project-forge\client\assets"

files_to_process = {
    "axe_1784155213061.png": "axe.png",
    "coal_1784155256469.png": "coal.png",
    "coal_node_1784155242104.png": "coal_node.png",
    "furnace_1784155263894.png": "furnace.png",
    "iron_ingot_1784155270677.png": "iron_ingot.png",
    "log_1784155234791.png": "log.png",
    "pickaxe_1784155205364.png": "pickaxe.png",
    "player_sprint2_1784155197509.png": "player.png",
    "tree_1784155227433.png": "tree.png"
}

for src, dst in files_to_process.items():
    src_path = os.path.join(artifact_dir, src)
    dst_path = os.path.join(assets_dir, dst)
    
    if os.path.exists(src_path):
        img = Image.open(src_path).convert("RGBA")
        
        # Start floodfill from the top-left pixel (0,0), replacing with transparent, with a tolerance
        ImageDraw.floodfill(img, (0, 0), (255, 255, 255, 0), thresh=80)
        # Also floodfill from the other corners just in case
        ImageDraw.floodfill(img, (img.width-1, 0), (255, 255, 255, 0), thresh=80)
        ImageDraw.floodfill(img, (0, img.height-1), (255, 255, 255, 0), thresh=80)
        ImageDraw.floodfill(img, (img.width-1, img.height-1), (255, 255, 255, 0), thresh=80)
        
        img.save(dst_path)
        print(f"Processed {src} to {dst}")
    else:
        print(f"File {src} not found!")
