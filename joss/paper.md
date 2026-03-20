---
title: 'TEG-Gateway: A Lightweight and Reusable Gateway for Scientific Sensor Networks'
tags:
  - Gateway
  - Thingsboard
  - IoT
  - Python
  - ACROPOLIS
authors:
  - name: Lars Frölich
    orcid: 0009-0000-1579-7727
    equal-contrib: true
    corresponding: true
    affiliation: 1
  - name: Patrick Aigner
    orcid: 0000-0002-1530-415X
    equal-contrib: true
    corresponding: true
    affiliation: 1
affiliations:
    - name: Environmental Sensing and Modeling, Technical University of Munich (TUM), Munich, Germany
      index: 1
date: 06 February 2026
bibliography: paper.bib
---

# Summary

The TEG-Gateway is a lightweight, general-purpose open source software built for managing and monitoring networks of 
IoT devices. 
It is built to integrate with the ThingsBoard platform and was designed specifically for operating distributed 
sensor networks for scientific research. 
Originally developed for and validated in the ACROPOLIS sensor network, it is network-agnostic and can be used with 
a wide range of IoT and sensor hardware.
The TEG-Gateway is designed to be robust against network and power outages, crashes, and other failures, thus reducing 
the risk of data loss, system downtime, or the need for physical intervention.
Hardware interfacing logic is delegated to a user-defined controller software which interacts with the TEG-Gateway 
via a message queue, separating infrastructure and application logic.


# Statement of need

Scientific sensor networks are widely used across various research disciplines, typically for long-term, continuous measurements. Such deployments often operate unattended for months or years in remote or inaccessible locations where physical intervention is costly or impossible. Furthermore, network connectivity in these environments is frequently intermittent or unreliable, posing significant challenges for data integrity and system monitoring.

While individual sensor networks vary in their hardware components, acquisition protocols, and domain-specific data processing, their underlying infrastructure requirements are remarkably consistent. Essential needs include reliable bidirectional communication with a central management platform, robust local data buffering to prevent data loss during network outages, and remote configuration capabilities. Additionally, the ability to perform safe software updates without interrupting active measurements and to automatically recover from software failures is critical for maintaining long-term operational stability.

Despite these commonalities, many research projects continue to develop custom gateway solutions from scratch. This leads to substantial duplicated engineering effort and often results in specialized, non-reusable implementations that are difficult to maintain or adapt. Providing a reusable architectural baseline addresses these challenges by decoupling infrastructure management from application-specific logic. By building upon a proven gateway design, research teams can focus their efforts on implementing the controller logic specific to their scientific goals. This approach not only reduces initial engineering overhead and accelerates deployment but also promotes architectural consistency and the long-term reuse of robust infrastructure across multiple studies and funding cycles.

# State of the Field

Main difference to others. We integrate the gateway in the edge device. This allows to deploy single devices at different locations without the need of a on location mist/fog gateway.

Open Source:
Local Gateways:
- Thingsboard Edge (local gateway, on location server): https://github.com/thingsboard/thingsboard-edge
- Thin Edge (split edge gateway and light on device): https://thin-edge.io/

Similar architectures:
- (On Device, Java Virtual Machine) Eclipse Kura: https://www.eclipse.org/kura/
- Ivy: https://joss.theoj.org/papers/10.21105/joss.08862
- IoT Fledge (north, south stack, no OTA): https://github.com/fledge-iot/fledge

Commercial:
- AWS IoT Greengrass (full stack, closed source): https://aws.amazon.com/greengrass/
- Azure IoT Edge (gateway mist): https://azure.microsoft.com/en-us/services/iot-edge/

Alternatives to Thingsboard:
- Kube Edge (remote sw management): https://kubeedge.io/en/
- Belena (Device OS + backend stack): https://www.balena.io/
- Tenta: https://joss.theoj.org/papers/10.21105/joss.07311


# Software Design

- Two-component architecture:
  - Edge Gateway (this software)
  - Controller Software (project-specific, we provide an example implementation)
- Good Scaling properties (ThingsBoard):
  - Controllers can be added or removed from the network as needed
- TEG-Gateway functionality:
  - MQTT-based communication with ThingsBoard
  - Tiered local buffering of telemetry, logs, and historical data
  - Server-authoritative remote file management and mirroring
  - Remote procedure calls for operational control
  - Controller-only over-the-air (OTA) updates using Git
  - Rollback to previous controller versions
  - Self-provisioning against ThingsBoard
  - Automated health monitoring and diagnostic telemetry
  - Graceful handling of network outages and controller failures
- Controller responsibilities:
  - Sensor/Actuator hardware interaction
  - Data acquisition and processing
- Controller is managed as a Docker container
- Architecture supports continuous gateway availability, regardless of the state of the controller software
- Architecture is designed to be robust against crashes, network outages, and other failures

## Implementation

- Implemented in Python (version 3.12+)
- Modular code structure separating communication, persistence, and operational logic
- Tiered persistence using specialized SQLite databases for communication, archiving, and logging
- SQLite-based inter-process communication (IPC) for controller-gateway interaction
- Docker used for controller isolation
- Git used for versioned controller repository management and OTA updates
- Static type checking using mypy
- Documentation generated using Sphinx

# Research impact statement

- The TEG-Gateway has been validated in a real-world scientific deployment within the ICOS Cities framework. It has enabled reliable data collection from a network of environmental sensors in an urban setting @ACROPOLIS2026.
- Example implementation @ACROPOLIS-edge


# Citations

- ThingsBoard[^1] @ThingsBoard2026 
- Docker @merkel2014docker
- Python @Python
- SQLite @SQLite
- Mypy @mypy
- Sphinx @Sphinx
- Paho MQTT Client @paho

[^1]: https://thingsboard.io/


# Author contributions
PA, FL:
- Conceptual design of the TEG-gateway software architecture
- Implementation of the TEG-Gateway software
- Documentation and user guides
- Deployment and validation in a real-world sensor network
- Joint contribution to manuscript preparation

JC:
- Principal investigator of the ACROPOLIS sensor network 

All authors reviewed the manuscript.

# Acknowledgements

- ICOS Cities framework
- Funding bodies (to be added)

# AI usage disclosure

Generative AI tools were used to assist with language refinement, formatting, and editorial support during manuscript preparation, and to aid documentation of the codebase and online materials. All AI-assisted outputs were reviewed and approved by the authors to ensure accuracy, technical correctness, and integrity.
