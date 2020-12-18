# Assessment Status
Assessment Partner have 2 ways to inform LaunchPad of a candidates status in the third party assessment process:

* Callback - Assessment Partner will automatically send updates to LaunchPad as the candidate moves along the assessment process.
* Polling - LaunchPad will send a GET request to the Assessment Partner's endpoint with a single query parameter `partner_interview_id`. After which the Assessment Partner's response should contain the candidate's assessment status

## Available Assessment Statuses

<aside class="notice">
  The assessment partner must send a Finished status for candidates synchronously. A Finished status is required before candidates are redirected back to the handback_url. Finished status must be sent using a POST request to LaunchPad's assessment_status endpoint
</aside>

Status      | Description
------------|------------
Initiated   | A successful invite request has been sent to the Assessment Partner.
Started     | Candidate has started the third party assessment.
In Progress | Candidate is in the process of completing the third party assessment.
Finished    | Candidate has completed the third party assessment but is yet to provided additional details (if requested).
Completed   | Candidate has completed the third party assessment and provided all the additional details (if requested). This is also the status when the scores are sent back to LaunchPad.

## Request content 

```json
{
  "partner": {
    "account_id": "account_id",
    "uuid": "partner_uuid"
  },
  "result_details": {
    "overall_score": "80",
    "project_score": "70",
    "raw_score": "80",
    "percentile": "90",
    "sten_score": "9",
    "z_score": "2",
    "t_score": "1",
    "grade": "B",
    "rag": "green",
    "norm_group": "A",
    "result_url": "http://example.com/assessments/12345",
    "result": "Pass",
    "status": "completed"
  },
  "interview": {
    "id": "interview_id",
    "uuid": "interview_uuid"
  },
  "assessment": {
    "id": "assessment_id",
    "custom_id": "custom_id"
  },
  "metadata": {
    "Started": "9:05 AM 03 May 2017",
    "Completed": "9:10 AM 03 May 2017",
    "Comments": "Great!",
    "timestamp": "2016-10-20T08:45:15Z"
  }
}
```

The contents of the request for both callback and polling methods are the same. The following table shows the contents and the descriptions for each field. For the callback method, LaunchPad is expecting a `POST` request to its `update assessment status` endpoint which contains the required request body. For polling, LaunchPad will send a `POST` request to the partner's polling endpoint and expect the response to contain the prescribed `JSON` payload.

Parameter       | Type    | Required  | Description
----------------|---------|-----------|-------------
partner         | Object  | **Yes**   | Contains partner details. Refer to the [partner details object section](#assessment-status-partner-object).
result_details  | Object  | **Yes**   | Contains result details. Refer to the [results detail object section](#result-details-object).
interview       | Object  | **Yes**   | Contains interview details. Refer to the [interview object section](#assessment-status-interview-object)
metadata        | Object  | **Yes**   | Contains metadata

<h3 id="assessment-status-partner-object">Partner Object</h3>

Parameter           | Type    | Required  | Description
--------------------|---------|-----------|------------
uuid                | String  | **Yes**   | Provided by LaunchPad. Unique identifier of the third party assessment provider in LaunchPad.
account_id          | String  | No        | Identifies the account used in the Assessment Partner system.
employer_feedback   | String  | No        | URL to download the feedback form that can be shown to the recruiter. Accepted file formats are .pdf, .txt, and .csv.
candidate_feedback  | String  | No        | URL to the feedback form that can be shown to the candidate. Accepted file formats are .pdf, .txt, and .csv.

### Result Details Object

> Result details snippet

```json
{
  #..snip..
  "result_details": {
    "status": "completed",
    "overall_score": "80",
    "project_score": "70",
    "raw_score": "80",
    "percentile": "90",
    "sten_score": "9",
    "z_score": "2",
    "t_score": "1",
    "grade": "B",
    "rag": "green",
    "norm_group": "A",
    "result_url": "http://example.com/assessments/12345",
    "result": "Pass"
  }
  #..snip..
}
```

Parameter     | Type                      | Required  | Description
--------------|---------------------------|-----------|------------
status        | String                    | **Yes**   | Describes the current state of the assessment instance. If the assessment has been completed and results are available, this value should be complete. Please refer to the list of supported [assessment statuses](#available-assessment-statuses).
overall_score | String                    | No        | Assessment summary score to be displayed to the recruiter.
project_score | String                    | No        | Project summary score to be displayed to the recruiter.
raw_score     | String                    | No        | Raw score for the candidate's assessment.
percentile    | String                    | No        | Percentile score for the candidate's assessment.
sten_score    | String                    | No        | Sten score for the candidate's assessment.
z_score       | String                    | No        | z_score for the candidate's assessment.
t_score       | String                    | No        | t_score for the candidate's assessment.
grade         | String                    | No        | Letter grade for the candidate's assessment. Usually A, B, C, D, E.
rag           | String                    | No        | Traffic light indicator for the candidate's assessment. Red, Amber, Green.
norm_group    | String                    | No        | Normative group for the candidate's assessment.
result_url    | String                    | No        | URL to the candidate’s page on the assessment Partner’s website.
result        | String (`Pass` or `Fail`) | No        | Text for candidate result.

<h3 id="assessment-status-interview-object">Interview Object</h3>
> Interview object snippet

```json
{
  #..snip..
  "interview": {
    "id": "interview_id",
    "uuid": "interview_uuid"
  }
  #..snip..
}
```
Parameter | Type    | Required | Description
----------|---------|----------|-------------
id        | String  | **Yes**  | Identifies a candidate’s assessment session.
uuid      | String  | **Yes**  | Provided by LaunchPad. Unique identifier of the candidate's assessment session.

### Metadata Object
> Metadata json snippet

```json
{ 
  #..snip..
  "metadata": {
    "started": "9:05 AM 03 May 2017",
    "completed": "9:10 AM 03 May 2017",
    "comments": "Great!",
    "timestamp": "2016-10-20T08:45:15Z"
  }
}
```

A non-nested object containing keys and values that will be displayed in our assessment results. All of the values must be Javascript primitives.

Parameter   | Type    | Required | Description
------------|---------|----------|-------------
timestamp   | String  | **Yes**  | Date and time when the event occurred.

## Callback Request
> Sample callback request from partner sent to LaunchPad:

```shell
POST 'https://www.launchpadrecruitsapp.com/assessments/assessment_status'
```
The Assessment Partner will send a callback to notify LaunchPad where the candidate is in terms of the third party assessment process.

## Callback Response
> Status code of a successful response is 200

```json
{
  "response": "OK"
}
```

LaunchPad will always reply with a simple response to the assessment status update.

## Polling Request
Launchpad will continously poll the partner's polling endpoint in order to fetch the assesment status of 

> Sample polling request from LaunchPad sent to partner:

```shell
POST 'https://www.example.com/parner_polling_endpoint'
```

## Polling Response

The expected response is the same as the callback request body. Please refer to the [request section](#request-content).
