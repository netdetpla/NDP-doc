# NDP demo UI 接口文档

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

  



""