# MOKBar

MOKBar is a inside navigation bar liberary written in objc.

Sometimes, we need hide the navigation bar in some viewcontrollers, but others don't. So we are having the bad ui experience when using edge gesture pan back.

MOKBar providing the sample usage and won't bother ur other ui logic, such as autolayout or UITableViewController or even navigation items. so u won't care about the details.


Sample
-----
![sample](https://github.com/oenius/MOKBar/blob/master/0.gif)


Usage
-----

If you got the almost logic , all you need is to add the code as follows.

```objective-c

  [self.navigationController setNavigationBarHidden:YES];
  self.holdInsideBarWhenPush = YES;
  
```

License
-------
	Copyright 2015 Oenius Jou
	
	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	
	    http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
