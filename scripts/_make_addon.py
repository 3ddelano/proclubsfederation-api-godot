# Make a zip of addons/proclubsfederation-api-godot

import shutil
import glob
import os

patterns = ["*.import"]
for pattern in patterns:
    for file in glob.glob("addons/**/" + pattern, recursive=True):
        print("Deleting " + file)
        os.remove(file)

version = input("Enter version: ")
shutil.make_archive(
    base_name="proclubsfederation-api-godot.v" + version,
    format="zip",
    root_dir="addons/",
    base_dir="proclubsfederation-api-godot",
)
print("Done")
