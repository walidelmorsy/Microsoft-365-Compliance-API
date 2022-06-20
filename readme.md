
# Compliance-API Script
A script which we have created to help with Microsoft 365 Compliance audit activities via Office 365 Management API.

> **NOTE**: Use these scripts at your own risk. Ensure you review the entire script and understand exactly what it does before using.  Test the scripts within a demo tenant or test environment before using in production.  We are not responsible for any result of using these scripts.

## Logic App to process Webhook Subscriptions

When you create the Blob Subscription you can setup a webhook to say push a blob to a Logic App. If you use a Trigger such as Http (this is the endpoint you'll use in the Webhook.)
Here is a sample logic App Which Processes the Blob and sends it to a Log Analytics Workspace with Separate Tables for Each Content Type.

## DLPDetailTo Log Analytics via Azure Run Book

Here is another sample where we use the PS cmdlets either you could use the Security & Compliance PowerShell modules or the Exchange  PowerShell module to use a command and store the output in Log Analytics.

There is also a helpful Post man collection here [PostmanCollection](https://documenter.getpostman.com/view/8229827/SVmr1M6o)

# Disclaimer

This Sample Code is provided for the purpose of illustration only and is not intended to be used in a production environment.  

THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.  

We grant You a nonexclusive, royalty-free right to use and modify the Sample Code and to reproduce and distribute the object code form of the Sample Code, provided that You agree: 
(i) to not use Our name, logo, or trademarks to market Your software product in which the Sample Code is embedded;
(ii) to include a valid copyright notice on Your software product in which the Sample Code is embedded; and
(iii) to indemnify, hold harmless, and defend Us and Our suppliers from and against any claims or lawsuits, including attorneys fees, that arise or result from the use or distribution of the Sample Code.
