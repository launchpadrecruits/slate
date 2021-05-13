# Candidate Assessment Status

```shell
https://partner-url.com/callback
```

LaunchPad sends callbacks to the partner application regarding the candidate scores and status.
* All assigned reviewers needs to score the assessment before a callback is sent
* If a reviewer changes his score post-callback, a new callback will be sent

## Request (LaunchPad to Partner)

> Sample JSON data body for candidate assessment status request

```json
{
  "candidate": {
    "id": "cnd_71419fjasdfsdak123",
    "email": "hpotter@hogwarts.com",
    "custom_invite_id": "123test"
  },

  "interview": {
    "id": "123"
  },

  "result_details": {
    "status": "reviewed",
    "average_score": "50",
    "total_score": "150",
    "reviewers": [
      {
        "email": "adumbledore@hogwarts.com",
        "score": "50",
        "comment": "Reviewer 1 comment"
      },
      {
        "email": "mmcgonagall@hogwarts.com",
        "score": "50",
        "comment": "Reviewer 2 comment"
      },
      {
        "email": "ssnape@hogwarts.com",
        "score": "50",
        "comment": "Reviewer 3 comment"
      }
    ]
  },

  "metadata": {
    "timestamp": "2018-01-24T15:25:00.000Z"
  },

  "overall_status": {
    "status": "In Progress"
  }
}
```

### Candidate Object
> Candidate object request body snippet

```json
{
    #..snip..
    "candidate": {
        "id": "cnd_ljdfhalswrhw3o21312",
        "email": "hpotter@hogwarts.com",
        "custom_invite_id": "123test"
    },
	#..snip..
}
```

Parameter       | Type    | Always present? | Description
----------------|---------|-----------------|------------
id              |String   | **Yes**         |Identifies the candidate in LaunchPad
email           |String   | **Yes**         |Email address of the candidate
custom_invite_id|String   | **Yes**         |Custom identifier for the invite request provided by the partner

### Interview Object
> Interview object request body snippet

```json
{
    #..snip..
    "interview":{
        "id": "123"
    },
	#..snip..
}
```

Parameter | Type    | Always present? | Description
----------|---------|-----------------|------------
id        |String   | **Yes**         |Identifies the interview in LaunchPad

### Result Details Object
> Result Details request body snippet

```json
{
    #..snip..
	"result_details": {
		"status": "reviewed",
		"average_score": "50",
		"total_score": "150",
		"reviewers": [{
			#..snip..
		]
	},
	#..snip..
}
```

Parameter    | Type    | Always present? | Description
-------------|---------|-----------------|------------
status       |String   | **Yes**         |Describes the current state of the assessment instance
average_score|String   | **Yes**         |Average score of the candidate
total_score  |String   | **Yes**         |Total score of the candidate

### Reviewers Object
> Reviewers object request body snippet.
> The Reviewers object is inside the Result Details object

 ```json
 {
	#..snip..
	"result_details": {
		#..snipp..
		"reviewers": [{
				"email": "adumbledore@hogwarts.com",
				"score": "50",
				"comment": "Reviewer 1 comment"
			},
			{
				"email": "mmcgonagall@hogwarts.com",
				"score": "50",
				"comment": "Reviewer 2 comment"
			},
			{
				"email": "ssnape@hogwarts.com",
				"score": "50",
				"comment": "Reviewer 3 comment"
			}
		]
	},
	#..snipp..
 }
 ```

Parameter    | Type    | Always present? | Description
-------------|---------|-----------------|------------
email        |String   | **Yes**         |Email address of the reviewer
score        |String   | **Yes**         |Total score the reviewer gave for the candidate
comment      |String   | **Yes**         |Comment the reviewer gave for the candidate

### Metadata Object
> Metadata object request body snippet

```json
{
    #..snip..
    "metadata": {
        "timestamp": "2018-01-24T15:25:00.000Z"
    }
	#..snip..
}
```

Parameter    | Type    | Always present? | Description
------------ |---------|-----------------|------------
timestamp    | String  | **Yes**         |Date and time when the event occurred

### Overall Status Object
> Overall status object request body snippet

```json
{
    #..snip..
    "overall_status": {
        "status": "In Progress"
    }
	#..snip..
}
```

Parameter    | Type    | Always present? | Description
------------ |---------|-----------------|------------
status       |String   | **Yes**         |Flag to determine the current progress of the entire candidate flow (In Progress, Completed)
