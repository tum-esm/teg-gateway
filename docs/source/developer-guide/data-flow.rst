Data Flows
==========

.. image:: ../_static/images/data-flow.png
   :alt: ThingsBoard Edge Gateway data flow diagram
   :width: 80%
   :align: center


There are different data flows involving the Gateway as a central component. 

1. **Device data flow**: Data from collected by the Controller is forwarded and archived by the Gateway to the ThingsBoard server. 

2. **Remote File Mangement**: The Gateway can be used to manage files on the Edge devices. This includes uploading files to the devices, downloading files from the devices via ThingsBoard Shared Attributes. More details are available in the :ref:`remote-file-management` section of the documentation.

3. **Remote Software Updates**: The Gateway supports remote software updates (OTA) that allow users to spawn a new controller version via Docker. This feature is managed via the Thingsboard WebUI. And is described in detail in the :ref:`remote-software-updates` section of the documentation.