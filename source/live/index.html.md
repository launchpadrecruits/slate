---
title: Live API 

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - live/create_assessment
  - live/invite_candidate
  - live/candidate_assessment_status
  - live/zoom_link_callback

search: true
---

# Introduction
Welcome to the Live API Docs! Stay awhile and listen.

# Authentication
Authentication to the API occurs via HTTP Basic Auth. You must set your API key as the auth username, and it should be done for all requests. All API requests are made over HTTPS, and your API Key is securely encrypted by the SSL channel.

##Invite Requests
If you are testing the API calls via cURL, you should set your request as follows:

```shell
curl -i https://launchpadrecruitsapp.com/1/interviews.json -u 'API_KEY:'
```

lp-api-key | API username to successfully send a request to the LaunchPad system. Provided by LaunchPad


##Callbacks
LaunchPad can send callbacks to the partner system with or without basic auth. Here is the cURL example:

```shell
curl -i https://partner-system.com/ -u 'partner-api-username:partner-api-password'
```

partner-username | Endpoint username to successfully send a callback to the partner system. Provided by partner
partner-password | Endpoint password to successfully send a callback to the partner system. Provided by partner

*All responses should be returned using JSON, including errors.*
