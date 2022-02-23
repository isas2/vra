## Пакет управления vRA 8

Материалы, к статье [vRO: пакет управления vRA 8 v2](https://as.zabedu.ru/virtual/vmware/vrealize/vro-vra2).

В статье описан небольшой набор процессов для управления vRA 8. Предлагаемый пакет позволит быстрее начать разрабатывать собственные процессы.

## vRA 8 management package

Materials for the article [vRO: vRA 8 management package](https://as.zabedu.ru/virtual/vmware/vrealize/vro-vra2).

This article describes a small set of workflows for managing vRA 8. This package will help you get started quickly developing your own workflows.

## v2.1.2 (10-02-2022)
### Configuration
* Add REST operations (vRA)
* Initialize (vRA)
* Invoke a REST operation (vRA)
* Update access token
* Update refresh token
### Orchestrator
* Execution
    * Cancel old workflow executions
    * Cancel workflow execution
    * Delete all workflow executions
    * Delete workflow execution
    * Get workflow execution
    * Get workflow execution logs
    * Get workflow execution state
    * Get workflow execution statistics
    * Get workflow execution syslogs
    * Get workflow executions
    * Run workflow
    * Run workflow and wait
* Workflow
    * Delete workflow
    * Get workflow
    * Get workflow scheduled tasks
    * Get workflows
    * Get workflows tree
    * Get workflow content
    * Update workflow content
* Cluster
    * Get cluster config
    * Get cluster runtime
    * Get execution statistics
* Configuration
    * Get configuration element
    * Increment config patch version
    * Update configuration element
* Task
    * Get task
    * Get task executions
    * Get tasks
### Service Broker
* Deployments
    * Check deployment exists
    * Get deployment
    * Get deployment ID by name
    * Get deployment count
    * Get deployment resource
    * Get deployment resources
    * Get deployments
* Catalog sources
    * Delete catalog source
    * Get catalog source
    * Get catalog sources
* Catalog entitlements
    * Delete entitlements
    * Get entitlements
    * New entitlement
* Catalog items
    * Get catalog item
    * Get catalog item version
    * Get catalog item versions
    * Get catalog items
    * Request catalog item
* Catalog item types
    * Get catalog item type
    * Get catalog item types
* Deployment actions
    * Get deployment action
    * Get deployment actions
    * Request deployment action
### Cloud Assembly
* Blueprints
    * Delete blueprint
    * Get blueprint
* Image profiles
    * Delete image profile
    * Get image profile
    * Get image profiles
    * Update image profile
* Project
    * Delete project
    * Get project
    * New project
    * Update project metadata
    * Update project properties
* Cloud account
    * Get cloud accounts
    * Sync cloud account images
* Networks
    * External network
        * Get external network IP range
        * Get external network IP ranges
        * Update external network IP ranges
    * Fabric network
        * Get fabric network
        * Get fabric network ID by name
        * Get fabric network vsphere by ID
        * Get fabric network vsphere by name
        * Get fabric networks
        * Get fabric networks vsphere
        * Update fabric networks vsphere
    * Get network IP ranges
    * Get network profiles
    * Get networks
    * Get subnet-ranges
    * New network IP range
    * New network profile
* Compute
    * Get fabric compute
    * Get fabric computes
    * Get machine
    * Get machines
* Onboarding
    * Get onboarding deployment
    * Get onboarding deployments
    * Get onboarding plan
    * Get onboarding plans
    * Get onboarding resource
    * Get onboarding resources
    * Get onboarding rule
    * Get onboarding rules
    * New onboarding plan
    * New onboarding rule
    * Run onboarding plan
* Location
    * Get region ID by name
    * Get regions
    * Get zones
* Content
    * Get sync status
    * Sync all project source
    * Sync source
