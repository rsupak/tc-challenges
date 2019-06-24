# Instance Branding
### The customer would like to alter the appearance of their newly-deployed ServiceNow platform.  Make the following changes:

1. Update the Banner Text to read: Simulator Client Instance
2. Update the Banner Colour to: #4790e7

# Create an Incident Template
### To speed up incident creation at the service desk, the customer has requested a new template for a commonly-reported specific CI (Bond Trading) with impact and urgency set to medium, as well as auto-filling Incident Management as the assignment group.

Create an incident template called 'Bond Trading Issue' that meets these requirements, ensuring it is available to everyone.

# View Management
To help them fulfil procurement tasks, the Hardware group needs to see additional information when looking at Catalog Requests.

For the Requests (sc_request) list, create a new LIST view called 'Delivery' to show the following fields in this order.
- Number
- Requested For
- Due Date
- Stage
- Delivery Address

# Define Assignment Rules
The customer would like to automate some assignment of incidents by category to the specific teams that deal with those category of incidents.

Use the existing Assignment Data Lookup Rules to configure the instance so that:

- "Hardware" category incidents should be auto-assigned to the "Hardware" group
- "Software" category incidents should be auto-assigned to the "Software" group

# New Module
All service delivery managers need to see the Status of Business Services deemed "most critical". 

Create a new module in the Self Service application menu (appearing under "Business Applications) that allows visibility to this information to those holding the "contract_manager" role.

Name the module: Critical Services Status

# Configure Security
Following a discussion with the Business transformation team, a policy has been agreed to only allow users with the 'change_manager' role to edit the 'Cab Recommendation' field on change requests.

Add an ACL that permits only this role the ability to change this field.

*In order to perform this task, you will need to log in as the admin user with the same password provided for your user account, then elevate roles and grant the security_admin role to your profile or edit the ACLs as admin.

# Configure Security
Following a discussion with the Business transformation team, a policy has been agreed to only allow users with the 'change_manager' role to edit the 'Cab Recommendation' field on change requests.

Add an ACL that permits only this role the ability to change this field.

*In order to perform this task, you will need to log in as the admin user with the same password provided for your user account, then elevate roles and grant the security_admin role to your profile or edit the ACLs as admin.

# Group Management
Any tasks specific to the ServiceNow Platform should be escalated to a support group called ServiceNow Liaison for communication with ServiceNow Support staff.

Create this group containing the following users, ensuring all group members hold the ITIL role:
- Alissa Mountjoy
- Gaston Cieloszyk
- Tori Villaescusa

# Importing Data
New printers have arrived, but not added to the cmdb_ci_printers table yet. 

Populate the table by importing data from the attached file that contains additional printers, coalescing on the asset tag field

Name the Import Set and Transform Map: Printers Import

# Policy Enforcement
By policy, any incident raised must have an assignment group specified if a configuration item (or business service) is populated.

Create a UI Policy for the incident form that makes *assignment group* mandatory when the Configuration Item field is not empty

# Workflow Development
The Facilities team have designed a more suitable workflow to handle requests for office desks.

Build a new workflow called "Office Desk Deployment" for "Desk Set Up" catalog requests, containing the following sequence of activities:

1. Approval User : requires their line manager
2. Catalog Task : with a short description of "Measure available space"
3. Catalog Task : with a short description of "Deliver desk to area and remove old desk"
4. Catalog Task (assigned to the Network team) with a short description of: "set up new working space"

Finally, associate this workflow for the "Desk Set Up" item in the Service Catalog

# New Catalog item
Due to a recent partnership, all employees are eligible for an attractive discount on a Solar-powered Sun Lamp. Using this image attached and content below, create a catalog item in the Service Catalog under the Hardware category, using "Procurement Process Flow - Hardware" as the items workflow.

Name: Actina Portable Sun Lamp

Short Description
For a healthy tan and a good feeling. Put an end to expensive salon treatments! Get the perfect tan all-around in the comfort and privacy of your home, any time you choose!

Description
Features of this modern Portable Tanning Solution:
- multimode rays (Ultra-violet AND Infra-red rays)
- charging via solar radiation, so no mains required
- innovative omnidirectional lamp (not depicted) ensures perfect tan through proprietry MultiScatter technology, reaching all body shapes
- cable compartment and carrier handle guarantee an easy storage and handling
- brass screws for thermal safety
- 2 protection goggles included
- batteries not included
- I before E except after C

Perihel is a subsidiary of Morningstar Industries(TM).

# Knowledge Workaround
Initech Incorporated have provided a workaround for a known issue affecting tricorder detection.

Use the information below to publish a new article in the 'IT' knowledge base under the "Devices" category.

*Short Description*: Tricorder detected Klingons on the starboard bow

*Text*:

Error: Klingons detected to the right
Solution:
1. Contact the engine room, warp factor 9.
2. Break the laws of physics, science and reality

Check it works by raising an incident with the description of "klingons spotted" - the article should show up as a suggested fix.

# Create a Report
For monday morning management meetings, Mara Rineheart requires a pie chart showing *all incidents created in the last 7 days*, broken down by *category*.

Create a report on the incident table meeting that requirement, scheduling it so that she receives it every Monday morning at 8am.

Hint: Ensure you make the filter using as simple a condition as possible to only return incidents created last 7 days.

# Capturing Changes
Now that Development, Test and Production environments are running well in the customer's infrastructure, Update Sets should be setup to capture changes intended to be migrated from dev to test.

Create a new update set called *'Simulator Client Changes'* in the *Global* application scope and make it your current update set to capture changes from now on.

# Internationalization
There is a possibility that Spanish-speaking customers will be using the platform. 

In preparation, activate the "I18N: Internationalization" and "I18N: Spanish Translations" plugins.

# New Functionality
Impressed with the new platform's features so far, the Finance team have asked if new functionality could help them track expense requests and tasks.

To meet security and confidentiality policies this custom application should be segregated from other business domains.

Begin work by creating an application *'Finance Work'* containing a single table called *'Expense Request'* that extends the Task table, accessible only to users with the (new) 'x_snc_finance_work.user' role.

# Fix a Business Rule
A developer has unexpectedly quit, leaving behind incomplete work that needs to be applied to the customer instance before being fixed.

1. import this XML file and once imported, examine the "Update live_profile with sys_user" Business Rule
2. correct all occurrences of "full_name" to read "name"

*make sure you are back in the global scope.

# Customize Code
Currently, policy prevents everyone from removing knowledge bases. 

It has been decided to delegate this responsibility to those holding the knowledge_admin role.

1. Add the following function into the KBKnowledgeBase Script Include to permit KB deletions

```
canDelete: function(knowledgeBaseGr) {
return true;
},
```

2. Amend the delete ACL on "kb_knowledge_base" to permit only the "knowledge_admin" role to be able to delete

*As per earlier task, if you haven't already done this, you may need to firstly log in as the admin user with the same password provided for your user account, then elevate roles and grant the security_admin role to your profile or edit the ACLs as admin.
