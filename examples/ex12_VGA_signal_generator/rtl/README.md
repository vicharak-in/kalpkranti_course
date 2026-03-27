# RTL Folder Guide

This folder contains the main Verilog files for the VGA signal generator.

## Main Files

- `display.v` → Top-level module (connects everything)
- `vga_controller.v` → Generates VGA timing signals
- `graphics.v` → Decides what appears on the screen
- `pattern/` → Contains different graphics patterns

---

## How to change the screen pattern

The screen output is controlled by the **graphics.v** file.

If you want to show a different pattern:

### Step 1: Open the pattern folder
```
rtl/pattern/
```

You will see files like:
```
checkboard_pattern.v
Horizontal_color_bands.v
moving_vertical_bar.v
RGB_vertical_bars.v
Bouncing_ball.v
```

---

### Step 2: Choose a pattern
Open any one of these files.

Example:
```
RGB_vertical_bars.v
```

---

### Step 3: Copy the code
Select and copy **all the code** inside that file.

---

### Step 4: Replace graphics.v content
1. Open `graphics.v`
2. Delete everything inside it
3. Paste the copied pattern code
4. Save the file

---

### Step 5: Run simulation again
Go to the `rtl` folder and run:

```
verilator -Wall -Wno-fatal --cc --exe ../sim/src/simulator.cpp display.v graphics.v vga_controller.v \
-LDFLAGS -lglut -LDFLAGS -lGLU -LDFLAGS -lGL

make -j -C obj_dir -f Vdisplay.mk Vdisplay

obj_dir/Vdisplay
```

You will now see the new pattern on the VGA screen.


