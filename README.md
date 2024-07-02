# iDashBoard

[Draft Phase]

## Introduction
Aim is to create intuitive UI from xml/json based widget configuration.

- Create widget libraries for - temperature, light control, motor control, labels, clock and many more
- Create module for connection management - AWS/Azure/Firebase connection
- Create settings page for
  - connection management
  - MQTT topic management
  - profile management

## How
### Widget generation phase
Input xml --> output widget code
 ```bash
<widget>
    <type>Temperature</type>
    ## property value is of interger type
    <property>
      <name>value</name>
      <type>int</type>
    </property>
    ## property title is of string type
    <property>
      <name>Title</name>
      <type>string</type>
    </property>
    ## property timestamp is of int
    <property>
      <name>timestamp</name>
      <type>int</type>
    </property>
    <property>
      <name>update-interval</name>
      <type>int</type>
    </property>
</widget>

Above reference will generate code/lib for temperature widget having - title, timestamp, update-interval and value as properties
```
### UI generation phase
Input xml File --> Output intuitive UI
e.g.
   ```bash
<element>
    <e-type
      size=large
      title=Temperature
      update-interval=10 />
</element>

Mentioned reference will create temperature widget whose value gets updated at regualar interval of 10 sec
```
![](./assets/doc/images/ex_temperature.png)
- xml file containing list of such element (temperature, motor etc..) should turn into UI

## Code Structure
- assets
 - doc
    - images
 - build
- dashboard
- widgets
  - clock
  - temperature
  - motor
  - street-light
  - light
  - vayu-light
  - air-pollution
  - valve
- examples
- tools

  
## References
- [mqtt-home](https://github.com/and3rson/mqtt-home)
- [dashing-mqtt](https://github.com/dnsmichi/dashing-mqtt)
- [easymqtt](https://www.easymqtt.app)
