# 2-DOF Ankle Mechanism 4-Bar Mechanism Analyzer

An interactive 3D kinematic analyzer, solver, and visualizer for a 2-DOF robotic ankle joint actuated by two parallel spatial crank-rod (RSS) link mechanisms.

Designed to model, visualize, and analyze the kinematics of the ankle pitch and roll based on specific mechanical geometry.

---

## 📸 Interactive Analyzer Preview

The analyzer runs entirely in the browser using HTML5 Canvas 3D rendering. It provides real-time solving of both **Inverse Kinematics (IK)** and **Forward Kinematics (FK)**, workspaces mapping, singularity analysis, and branch visualization.

---

## 🛠️ Mechanism Geometry & Topology

Based on CAD specifications:
* **Motor ① (Right Actuator)**: Crank center at $Z = 27\text{ cm}$. Crank arm points **RIGHT ($+X$)** when at $0^\circ$. Rod length $L_1 = 25\text{ cm}$.
* **Motor ② (Left Actuator)**: Crank center at $Z = 19\text{ cm}$. Crank arm points **LEFT ($-X$)** when at $0^\circ$. Rod length $L_2 = 17\text{ cm}$.
* **Ankle Joint**: 2-DOF Universal Joint (U-joint) centering at $Z = 2\text{ cm}$.
* **Rod Attachments**: Separated laterally on the U-joint yoke arms ($X$-axis, total separation $E = 2\text{ cm}$).
* **Workspace**: $\pm 20^\circ$ Pitch, $\pm 15^\circ$ Roll.

### 📐 Coordinate System
* **X-axis**: Lateral (Right is $+X$)
* **Y-axis**: Sagittal/Forward (Into the screen is $+Y$)
* **Z-axis**: Vertical/Up (Upwards is $+Z$)
* **Origin**: Ground level at the ankle centerline

---

## ⚡ Mathematical Model

### Crank Tip Positions
$$\mathbf{P}_{\text{crank1}}(\theta_1) = \begin{bmatrix} +r_1 \sin\theta_1 \\ 0 \\ z_1 + r_1 \cos\theta_1 \end{bmatrix}$$
$$\mathbf{P}_{\text{crank2}}(\theta_2) = \begin{bmatrix} -r_2 \sin\theta_2 \\ 0 \\ z_2 + r_2 \cos\theta_2 \end{bmatrix}$$

### Ankle Ball Joint Positions (World Coordinates)
$$\mathbf{P}_{\text{world}} = \mathbf{R}(\theta_{\text{pitch}}, \theta_{\text{roll}}) \mathbf{P}_{\text{body}} + \mathbf{U}_{\text{joint\_center}}$$

Where:
* $\mathbf{R}(\theta_{\text{pitch}}, \theta_{\text{roll}}) = \mathbf{R}_x(\theta_{\text{pitch}}) \mathbf{R}_y(\theta_{\text{roll}})$
* $\mathbf{P}_{\text{body, 1}} = \begin{bmatrix} +E/2 \\ 0 \\ +h \end{bmatrix}$ (Right attachment)
* $\mathbf{P}_{\text{body, 2}} = \begin{bmatrix} -E/2 \\ 0 \\ +h \end{bmatrix}$ (Left attachment)

---

## 🚀 Key Features

1. **Dual-Mode Solver**:
   * **Inverse Kinematics (IK)**: Directly input target ankle pitch and roll angles to calculate the required motor angles $\theta_1$ and $\theta_2$.
   * **Forward Kinematics (FK)**: Input motor angles $\theta_1$ and $\theta_2$ to find the resulting ankle pitch and roll.
2. **Real-time 3D Visualization**:
   * Rotatable/zoomable 3D viewport representing the motors, cranks, rods, U-joint yoke, and base plate.
   * Color-coded coordinate axes and joints.
   * Multi-view presets (Front, Side, Top, Isometric).
3. **Workspace & Singularity Heatmap**:
   * Computes a 2D resolution grid showing valid configurations in green and singularities/unreachable domains in red.
   * Superimposes a bounding box representing the active workspace boundaries ($\pm 20^\circ$ pitch, $\pm 15^\circ$ roll).
4. **Dynamic Configuration Controls**:
   * Adjustable geometry parameters (crank lengths, rod lengths, motor heights, ankle height, crank separation, etc.) in real-time.
   * Multi-branch solver selection (Branch $+$ vs Branch $-$).

---

## 🏃 How to Run Locally

Since this tool is built entirely with vanilla HTML5, CSS3, and JavaScript, it has **zero dependencies** and does not require a build step.

### Option A: Local File URL
Simply double-click or open `index.html` directly in your browser:
```bash
google-chrome index.html
```

### Option B: Local Development Server
Run a Python one-liner in the repository directory to serve it over HTTP:
```bash
python3 -m http.server 8000
```
Then visit: `http://localhost:8000`

---

## 📊 Verification & Workspace Analysis

* **Coverage**: $100\%$ workspace coverage achieved for $\pm 20^\circ$ pitch and $\pm 15^\circ$ roll.
* **Neutral Position Solution ($0^\circ$ Pitch, $0^\circ$ Roll)**:
  * Motor ① $\theta_1 \approx 49.0^\circ$ (Crank points upper-right)
  * Motor ② $\theta_2 \approx 49.4^\circ$ (Crank points upper-left)
  * Verified Rod Lengths: $25.000\text{ cm}$ & $17.000\text{ cm}$
* **Kinematic Coupling**:
  * **Symmetric crank movement** (same direction) translates to ankle **Pitch**.
  * **Differential crank movement** (opposite direction) translates to ankle **Roll**.
