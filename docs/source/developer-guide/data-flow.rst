Data Flows
==========

.. image:: ../_static/images/data-flow.png
   :alt: TEG Gateway data flow diagram
   :width: 80%
   :align: center


Several data flows involve the Gateway as the central component:

1. **Device Data Flow**

   Data collected by the Controller is forwarded by the Gateway to the
   ThingsBoard server via MQTT, where it is archived and made available
   for monitoring and analysis.

2. **Remote File Management**

   The Gateway enables remote file management on edge devices. Files can
   be uploaded to or downloaded from devices using ThingsBoard Shared
   Attributes.

   See :ref:`remote-file-management` for details.

3. **Remote Software Updates**

   The Gateway supports over-the-air (OTA) software updates that allow
   new controller versions to be deployed via Docker. Updates are
   triggered and managed through the ThingsBoard Web UI.

   See :ref:`remote-software-updates` for details.