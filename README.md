# CST-MATLAB-2.4Ghz-Antenna
**ISM standard 2.4–2.5 GHz microstrip antenna for microcontroller-based wireless and IoT systems**

[![License](https://img.shields.io/github/license/DarkSoulEngineer/CST-MATLAB-2.4Ghz-Antenna)](LICENSE)
![Language](https://img.shields.io/badge/language-MATLAB-blue)
![Simulation](https://img.shields.io/badge/simulation-CST%20Studio%20Suite-ff6f00)

<p align="center">
  <img src="images/Logo.png" alt="Antenna logo" width="200">
</p>

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Related Projects](#related-projects)
- [License](#license)

## Overview

This project focuses on the design and simulation of a 2.4 GHz antenna using **CST Studio Suite** and **MATLAB**. It is aimed at the **ISM band (2.4–2.5 GHz)**, which is extensively used in Wi-Fi, Bluetooth, and IoT applications. The design process is facilitated through MATLAB scripting and leverages the [CST-MATLAB-API](https://github.com/simos421/CST-MATLAB-API) for antenna generation and analysis — the script builds the parameterized model, runs the solver, and exports the results without manual modeling in the CST GUI.

## Key Features

- **Antenna Geometry**
  - Chip antenna
  - Parameterized geometry
  - 2.4 GHz antenna design
- **MATLAB Scripting**
  - Scripted antenna design from `antenna.m`
  - CST-MATLAB-API integration
- **Simulation and Analysis**
  - CST Studio Suite frequency-domain simulation (2.4–2.4835 GHz, 201 points)
  - Far-field monitor at 2.4 GHz and S-parameter export for antenna performance analysis

## Requirements

- [CST Studio Suite 2019 or later](https://software.3ds.com/) — select the correct version for the API (e.g. 2024)
- [MATLAB R2019b or later](https://www.mathworks.com/downloads/?s_tid=rh_bn_dl/)
- [CST-MATLAB-API](https://github.com/simos421/CST-MATLAB-API) available as `./CST-MATLAB-API` inside the project (the script adds it to the MATLAB path)
- Windows, since the script drives CST Studio through MATLAB COM automation (`actxserver`)
- Optional: [CST Studio tutorial](https://r1132100503382-eu1-3dswym.3dexperience.3ds.com/community/swym:prd:R1132100503382:community:39?content=swym:prd:R1132100503382:wikitree:_NXifU43Q7yHzTiCX9yEaw) for getting started with the tool

## Installation

```bash
git clone https://github.com/DarkSoulEngineer/CST-MATLAB-2.4Ghz-Antenna.git
cd CST-MATLAB-2.4Ghz-Antenna
git clone https://github.com/simos421/CST-MATLAB-API.git
```

The API must sit in `./CST-MATLAB-API` next to `antenna.m`, which is where the `addpath` calls in the script look for it.

## Usage

1. Open `antenna.m` in MATLAB with CST Studio Suite installed and licensed.
2. Run the script. It launches CST Studio via COM automation and builds the parameterized antenna geometry: copper trace segments, Teflon PCB substrate, FR-4 ground plane, and a waveguide feed port. The project is saved as `Antenna_2.4GHz.cst`.
3. The script then defines the frequency-domain solver for 2.4–2.4835 GHz (201 frequency points), adds a far-field monitor at 2.4 GHz, and exports the S-parameters to `./OUTPUT/s_param.txt`.
4. Review the S-parameter and far-field results in CST Studio Suite.

## Screenshots

![PCB antenna layout](images/pcb_antenna.png)

## Related Projects

- **[YouTube channel @tensorbundle](https://www.youtube.com/@tensorbundle)** — antenna simulation, CST-MATLAB API walkthroughs, and other engineering content.
- **[MATLAB Antenna Toolbox](https://www.mathworks.com/products/antenna.html)** — MathWorks toolbox used for antenna analysis.

## License

MIT — see [LICENSE](LICENSE).

> [LinkedIn](https://www.linkedin.com/in/milchis-catalin-marian-824b61335/) &nbsp;&middot;&nbsp;
> GitHub [@DarkSoulEngineer](https://github.com/DarkSoulEngineer)
