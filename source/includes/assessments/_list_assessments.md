# List Assessments

> Sample list assessment request to assessment partner:

```shell
GET 'https://www.partner.com/api/list_assessments?partner_account_id=12345'
```

LaunchPad will first need to retrieve the list of assessments from the Assessment Partner using the `list_assessments` API endpoint. We will show the list of available assessments to the user, who will to select the appropriate 3rd party assessment to be included in a LaunchPad Assessment Flow.

Third party assessment IDs can be manually added into LaunchPad if necessary.

<h2 id="list-assessment-response">Response</h2>

> Sample expected JSON response for list assessments request

```json
{
  "partner": {
    "uuid": "partner_uuid",
    "account_id": "account_id"
  },
  "assessments": [
    {
      "id": "1",
      "name": "First Assessment",
      "project_id": "1",
      "custom_id": "custom_id xyz"
    },
    {
      "id": "2",
      "name": "Second Assessment",
      "project_id": "1",
      "custom_id": "custom_id abc"
    }
  ]
}
```
LaunchPad expects a JSON object with the following contents:

Parameter   | Type    | Required  | Description
------------|---------|-----------|-------------
partner     | Object  | **Yes**   | Contains partner details
assessments | Array   | **Yes**   | Array of assessment objects

### Partner Object
Parameter   | Type    | Required  | Description
------------|---------|-----------|------------
uuid        | String  | **Yes**   | Provided by LaunchPad. Unique identifier of the third party assessment provider in LaunchPad.
account_id  | String  | No        | Identifies the account used in the Assessment Partner system.

### Assessment Object

> Assessments object array request body snippet

```json
{
  #..snip..
  "assessments": [
    {
      "id": "1",
      "name": "First Assessment",
      "project_id": "1",
      "custom_id": "custom_id xyz"
    },
    {
      "id": "2",
      "name": "Second Assessment",
      "project_id": "1",
      "custom_id": "custom_id abc"
    }
  ]
}
```
Parameter   | Type    | Required  | Description
------------|---------|-----------|-------------
id          | String  | **Yes**   | Identifies a assessment available to an organization.
name        | String  | **Yes**   | Descriptive title for the assessment. We will use this value in our UI as the assessment’s label.
project_id  | String  | No        | Identifies a group of assessments.
custom_id   | String  | No        | Custom identifier that can be used by the third party assessment provider.
