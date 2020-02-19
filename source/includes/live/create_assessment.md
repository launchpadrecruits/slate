# Create Assessment

> Sample create assessment request

```shell
https://launchpadrecruitsapp.com/1/live
```

When an integration partner wishes to create a Live assessment 

## Request (Partner to LaunchPad)

> Sample JSON data body for create assessment request

```json
{
    "interview": {
        "title": "Sample Live Assessment",
        "description":"optional field",
        "email": "validlpuser@email.com"
    }
}
```

Partner will send the JSON data with the following contents:

### Interview Object

Parameter    | Type    | Always present? | Description
------------ |---------|-----------------|------------
title        | String  | **Yes**         |Title of the Live assessment. Provided by the Partner
descrption   | String  | **No**          |Additional reference details for the assessment. Provided by the Partner
email        |String   | **Yes**         |Email address of the LaunchPad user where the assessment is attributed

## Response (LaunchPad to Partner)

> Sample JSON data body for create assessment response

```json
{
    "interview": {
        "id": "4567",
        "title": "Sample Live Assessment",
        "description":"optional field",
        "email": "validlpuser@email.com"
    }
	
	"metadata": {
        "timestamp": "2019-03-21T22:57:33Z"
    }
}
```

LaunchPad will respond with a JSON data with the following contents:

### Interview Object
> Interview object response body snippet

```json
{
    #..snip..
    "interview": {
        "id": "4567",
        "title": "Sample Live Assessment",
        "description":"optional field",
        "email": "validlpuser@email.com"
    }
    #..snip..
}
```

Parameter    | Type    | Always present? | Description
------------ |---------|-----------------|------------
id           | String  | **Yes**         |LaunchPad identifier for the Live assessment
title        | String  | **Yes**         |Title of the Live assessment. Provided by the Partner
descrption   | String  | **No**          |Additional reference details for the assessment. Provided by the Partner
email        |String   | **Yes**         |Email address of the LaunchPad user where the assessment is attributed

### Metadata Object
> Metadata object response body snippet

```json
{
    #..snip..
    "metadata": {
        "timestamp": "2019-03-21T22:57:33Z"
    }
    #..snip..
}
```

Parameter    | Type    | Always present? | Description
------------ |---------|-----------------|------------
timestamp    | String  | **Yes**         |Date and time when the event occurred