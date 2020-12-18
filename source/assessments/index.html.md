---
title: Modular Assessments API

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - assessments/list_assessments
  - assessments/invite_candidate
  - assessments/assessment_status
  - assessments/update_candidate
  - assessments/reset_candidate

search: true
---

# Introduction
Welcome to the Modular Assessments Docs! Stay awhile and listen.

<aside class="info">
  All the endpoint URLs should be provided by the Assessment Partner to LaunchPad. The endpoint URLs used in this document are examples and it is completely up the Assessment Partner to name the URL paths for each of the API endpoint.
</aside>


# Authentication
LaunchPad expects the assessment partner to use basic auth. Assessment partner must provide a username and password, LaunchPad will use the provided credentials for each API request sent to the assessment partner. All API requests should be made over HTTPS.

All responses should be returned using JSON, including errors.

# Notifications
LaunchPad can send email reminders for the integrated third party assessments. This can be enabled by LaunchPad representatives.
LaunchPad expects the assessment partner to use basic auth. Assessment partner must provide a username and password, LaunchPad will use the provided credentials for each API request sent to the assessment partner. All API requests should be made over HTTPS.
