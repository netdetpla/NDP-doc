# NDP UI 接口文档

## 镜像

### 上传镜像

#### Request

- Method: **POST** 

- URL: ```/image/upload```

- Body: 

  ```json
  {
      "image-name": "scanservice",
      "tag": "1.2.3",
      "test-param": "1.1.1.1",
  }
  ```

  ```param```为测试任务参数，目前不使用，保留。

#### Response

- Body:

  ```json
  {
      "code": 200,
      "message": "image has been uploaded."
  }
  ```

### 镜像种类列表

#### Request

- Method: **GET**

- URL: ```/image```

- Body: 

  ```
  
  ```

#### Response

- Body:

  ```json
  {
      "code": 200,
      "message": "OK",
      "data": [
          "scanservice",
          "dnssecure",
          "dnsau"
      ]
  }
  ```


### 镜像列表

#### Request

- Method: **GET**

- URL: ```/image/{image_name}```

- Body:

  ```json
  
  ```

#### Response

- Body:

  ```json
  {
      "code": 200,
      "message": "OK",
      "data": [
          {
              "tag": "1.0.0",
              "upload-time": "2018.09.01",
              "current-use": true
          },
          {
              "tag": "1.0.1",
              "upload-time": "2019.01.01",
              "current-use": false
          }
      ]
  }
  ```

### 镜像信息

#### Request

- Method: **GET**

- URL: ```/image/{image}/{tag}```

- Body:

  ```
  
  ```

#### Response

- Body

  ```json
  {
      "code": 200,
      "message": "OK",
      "data": {
          "image-name": "scanservice",
          "tag": "1.2.1",
          "current-use": true,
          "upload-time": "2019.03.01",
          "size": "800MB",
          "test": {
          	"cpu": "0.5",
          	"memory": "512",
          	"bandwidth" "20"
      	}
      }
  }
  ```

  ```current-use``` 为当前镜像使用的```tag```。

  ```test```为镜像测试结果，目前不使用，保留。

## 任务

### 下发

#### Request

- Method: **POST**

- URL: ```/task```

- Body

  ```json
  {
      "image-name": "scanservice",
      "tag": "1.2.1",
      "param": "1.1.1.1"
  }
  ```

#### Response

- Body

  ```json
  {
      "code": 200,
      "message": "OK"
  }
  ```

### [镜像种类列表](#镜像种类列表)

见上

### 镜像任务列表

#### Request

- Method: **GET**

- URL: ```/task/{image_name}```

- Body

  ```
  
  ```

#### Response

- Body

  ```json
  {
      "code": 200,
      "message": "OK",
      "data": [
          {
              "id": 10000,
              "task-name": "scanA",
              "start-time": "2019.03.14 09:00:00",
              "end-time": "2019.03.15 09:00:00"
          },
          {
              "id": 10001,
              "task-name": "scanB",
              "start-time": "2019.03.14 09:00:00",
              "end-time": "2019.03.15 09:00:00"
          }
      ]
  }
  ```


### 临时结果列表

#### Request

+ Method: **GET**

+ URL: ```/result/{image_name}```

+ Body

  ```
  
  ```
#### Response

  ```json
{
    "code": 200,
    "message": "OK",
    "data": [
        {
            "rid": 1,
            "tid": 101
        },
        {
            "rid": 2,
            "tid": 102
        }
    ]
}
  ```

### 临时结果详情

#### Request

+ Method: **GET**

+ URL: ```/result/{image_name}/{rid}```

+ Body

  ```
  
  ```

  

#### Response

```json
{
    "code": 200,
    "message": "OK",
    "data": [
        ["ip", "118.67.200.10"],
        ["hardware", "hardware"],
        ["os_version", "DD-WRT v24-sp2 (Linux 2.4.37)"],
        ["ports", "53, 80"]
    ]
}
```

## 统计分析

### 统计图表

#### Request

- Method: **GET**

- URL: `/statistic/charts`

- Body

  ```
  
  ```

#### Response

```json
{
  "code": 200,
  "message": "OK",
  "data": {
    "port": {
      "labels": ["80", "443", "22", "53", "8080"],
      "data": [1054, 732, 261, 99, 8]
    },
    "service": {
      "labels": ["http", "https", "ssh", "dns", "smtp"],
      "data": [1102, 732, 261, 99, 2]
    },
    "hardware": {
      "labels": ["general purpose", "router", "WAP", "hub", "others"],
      "data": [1825, 447, 142, 85, 203]
    },
    "os": {
      "labels": ["Linux", "Windows", "others"],
      "data": [2133, 981, 362]
    }
  }
}
```

### 搜索统计

#### Request

- Method: **POST**
- URL: `/statistic/search`
- Body:

```json
{
    "type": "port",
    "keyword": "80"
}
```

#### Response

```json
{
  "code": 200,
  "message": "OK",
    "data": [
        {
            title: "端口",
            type: "bar",
            labels: ["80", "443", "53", "21"],
            data: [1022, 609, 331, 112]
        },
        {
            title: "服务",
            type: "bar",
            labels: ["http", "dns", "snmp", "ssh"],
            data: [1022, 609, 331, 112]
        },
        {
            title: "操作系统",
            type: "doughnut",
            labels: ["Linux", "Windows", "other"],
            data: [1022, 609, 331]
        },
        {
            title: "硬件",
            type: "doughnut",
            labels: ["WAP", "router", "PC", "other"],
            data: [1022, 609, 331, 112]
        }
    ]
}
```

### 散点图数据

#### Request

- Method: **GET**
- URL: `/statistic/map`
- Body:

```

```

#### Response

```json
{
    "code": 200,
    "message": "OK",
    "data": [
        {"lnglat": [116.405285, 39.904989], "level": 1},
        {"lnglat": [117.190182, 39.125596], "level": 2}
    ]
}
```



