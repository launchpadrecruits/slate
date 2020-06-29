# Reset Candidate
When a reset candidate is triggered in LaunchPad, LaunchPad will send a POST request to the Assessment Partner's reset candidate endpoint

<h2 id="reset-candidate-request-content">Request Content</h2>
Parameter       | Type    | Required  | Description
----------------|---------|-----------|-------------
partner         | Object  | **Yes**   | Partner details
candidate       | Object  | **Yes**   | Candidate details.
assessment      | Object  | **Yes**   | Assessment details
interview       | Object  | **Yes**   | Interview details.

<h3 id="reset-candidate-partner-object">Partner Object</h3>
Parameter           | Type    | Required  | Description
--------------------|---------|-----------|------------
uuid                | String  | **Yes**   | Provided by LaunchPad. Unique identifier of the third party assessment provider in LaunchPad.
account_id          | String  | **Yes**   | Identifies the account used in the Assessment Partner system.

<h3 id="reset-candidate-candidate-object">Candidate Object</h3>
Parameter           | Type    | Required  | Description
--------------------|---------|-----------|------------
id                  | String  | **Yes**   | Provided by LaunchPad on the request body. That same value should be returned in the response. Used internally by LaunchPad to identify the candidate

<h3 id="reset-candidate-assessment-object">Assessment Object</h3>
Parameter           | Type    | Required  | Description
--------------------|---------|-----------|------------
id                  | String  | **Yes**   | Provided by LaunchPad on the request body. That same value should be returned in the response. Used internally by LaunchPad to identify the assessment

<h3 id="reset-candidate-interview-object">Interview Object</h3>
Parameter           | Type    | Required  | Description
--------------------|---------|-----------|------------
uuid                | String  | **Yes**   | Provided by LaunchPad. Identifies the candidate assessment session in LaunchPad. LaunchPad will send the same UUID from the initial invite

<h2 id="reset-candidate-request">Request</h2>
```json
{
  "partner": {
    "uuid": "partner_uuid",
    "account_id": "account_id",
    "send_invite": false
  },
  "candidate": {
    "id": "sample_candidate_id"
  },
  "assessment": {
    "id": "12345",
    "custom_id": "custom_id",
  },
  "interview": {
    "uuid": "interview_uuid"
  }
}
```

<h2 id="reset-candidate-response-content">Response Content</h2>
Exactly the same with the request content, except for the addition of the timestamp metadata

<h3 id="reset-candidate-metadata-object">Metadata Object</h3>
Parameter           | Type    | Required  | Description
--------------------|---------|-----------|------------
timestamp           | String  | **Yes**   | Date and time when the event occurred

<h2 id="reset-candidate-response">Response</h2>

```json
{
  "partner": {
    "uuid": "partner_uuid",
    "account_id": "account_id"
  },
  "interview": {
    "uuid": "interview_uuid",
    "id": "98765",
    "url": "https://partner.com/testhere",
    "username": "username",
    "password": "password",
    "web_token": "727FFD3A-7C56-45CC-A579-DF93FE0325E9"
  },
  "candidate": {
    "id": "sample_candidate_id"
  },
  "assessment": {
    "id": "12345"
  },
  "metadata": {
    "timestamp": "2016-10-20T08:45:15Z"
  }
}
```
