Setup from Image
================

This section describes how to create an image after the system setup to flash it on multiple systems. This allows to avoid repeating the setup steps on each system. 

Follow installation and setup instructions for a single system first. Skip the provisioning step as this needs to be done for each system individually after flashing the image.

An image can be created from the prepared system and then flashed onto other systems. The new systems can then be renamed and provisioned individually.

See :ref:`_teg_gateway_installation` and :ref:`_setup`

Create Backup Image
-------------------

.. code-block:: bash

    diskutil list
    # diskutil umountDisk /dev/disk[*]
    # dd status=progress bs=4M  if=/dev/disk[*] | gzip > //Users/.../


 -> Insert fresh SD Card.

Flash image onto card
-------------------

.. code-block:: bash

    diskutil list
    diskutil umountDisk /dev/disk[*]
    gzip -dc //Users/.../teg-image.gz | sudo dd of=/dev/disk[*] bs=4M status=progress


Remove SD Card and insert into RaspberryPi/edge-device.

(Optional) Change Hostname (Raspberry Pi):
------------------------------------
.. code-block:: bash
    
    sudo raspi-config
    # Navigate to: System Options → Change Hostname
    sudo reboot


Provision Device
----------------

The device self-provisions upon its initial MQTT connection with ThingsBoard. See :ref:`_setup_device_provisioning`