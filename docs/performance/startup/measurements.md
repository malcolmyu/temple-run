# 冷加载测量结果

每组三轮；时间单位毫秒，字节含HTML及浏览器估算响应头。原始记录在raw/。

|组别|开始按钮可用|可玩TTI|FCP|首屏字节|请求数|
|---|---:|---:|---:|---:|---:|
|controlledBeforeFast|22,218.9|22,327.0|756.0|4,056,515.0|36.0|
|controlledAfterFast|2,550.2|2,588.6|604.0|376,814.0|13.0|
|controlledBeforeSlow|25,801.3|25,860.1|1,572.0|4,056,515.0|36.0|
|controlledAfterSlow|3,562.8|3,599.3|1,420.0|376,814.0|13.0|
|publicBeforeFast|25,149.7|25,220.6|3,120.0|4,074,145.0|36.0|
|publicAfterFast|2,766.5|2,857.2|720.0|381,410.0|13.0|
|publicAfterSlow|3,700.9|3,745.8|1,452.0|381,410.0|13.0|

## 每轮可玩TTI

- controlledBeforeFast：22327.0, 22581.9, 22116.0
- controlledAfterFast：2590.4, 2588.6, 2455.9
- controlledBeforeSlow：25828.5, 25860.1, 25911.0
- controlledAfterSlow：3597.1, 3599.3, 3627.0
- publicBeforeFast：31567.6, 25220.6, 23391.2
- publicAfterFast：2839.1, 2857.2, 2868.5
- publicAfterSlow：3745.8, 3744.7, 3760.6
