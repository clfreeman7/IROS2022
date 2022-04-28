# IROS2022
This repository includes Arduino and MATLAB files for IROS 2022. 

## Gait Library
The gait library (an array of Gait() objects that details each gait's change in robot pose and other attributes) is generated by running demo_Gait.m. The structure of the dependencies, as well as the connections to classes in other demos are shown below:

![Diagram](/IROS%202022%20%20(1).png)

- **ExperimentalData**
This superclass is used for generalized analysis of Arun's visual tracking data. 
- **PrimitivesTest**
This ExperimentalData subclass is used for processing motion primitive data resulting from having the robot execute Euler tours (exhaustive exploration). Demos can be found [here] (/demos/demo_PrimitivesTest.m) and https://github.com/clfreeman7/IROS2022/blob/main/demos/demo2_PrimitivesTest.m .
- **GaitTest**
This ExperimentalData subclass is used for processing sequentially repeated gaits, usually found via gait synthesis. The gaits are typically repeated for 30 cycles. A demo is shown in https://github.com/clfreeman7/IROS2022/blob/main/demos/demo_PrimitivesTest.m 
- **PathTest**
_(future implementation)_ This ExperimentalData subclass is used for processing open-loop gait-switching sequences. 
- **GaitSynthesizer**
This handle class is used to syntehsize (generate) gaits by incorporating the motion primitive data. A demo is shown in https://github.com/clfreeman7/IROS2022/blob/main/demos/demo_GaitSynthesizer.m .

