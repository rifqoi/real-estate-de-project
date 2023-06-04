# Real Estate Data Pipeline Projet

Data pipeline using DataOps and Medallion Architecture.

## Description

---

### Objective

This repository is intended to create a data pipeline to analyze real estate analytics in Jakarta Greater Area, specifically in Jakarta.
The pipeline will collect data from multiple real estate websites on a daily basis. To facilitate efficient and scalable development, this project will implement DataOps principles utilizing Infrastructure as Code (IaC) tools like Terraform, Ansible, and GitOps.

## Tools and Technologies

- Apache Airflow
- Kubernetes (Google Kubernetes Engine)
- Terraform
- Ansible
- Github Actions (CI/CD)
- Apache Spark (Databricks or Dataproc)
- Apache Iceberg table Format
- Google Cloud Storage
- BigQuery
- Looker Dashboard

| No  | Task List                                                                    | Status |
| --- | ---------------------------------------------------------------------------- | ------ |
| 1   | Create a Kubernetes Cluster in GKE using Terraform.                          | ❌     |
| 2   | Deploy Airflow Helm Chart in GKE using Ansible.                              | ❌     |
| 3   | Implement CI/CD for Airflow using Github Actions.                            | ❌     |
| 4   | Deploy Github Actions in Kubernetes Cluster with Ansible.                    | ❌     |
| 5   | Develop Python scripts to scrape real estate data asynchronously in Jakarta. | ❌     |
| 6   | Create PySpark jobs for data processing.                                     | ❌     |
| 7   | Run Apache Spark in Dataproc or Databricks.                                  | ❌     |
| 8   | Implement Medallion Architecture for Data Lakehouse in GCP.                  | ❌     |
| 9   | Utilize Apache Iceberg Table Format in Google Cloud Storage.                 | ❌     |
| 10  | Load transformed data into BigQuery.                                         | ❌     |
| 11  | Create Looker dashboards from BigQuery data.                                 | ❌     |

Nice to Have:

1. ArgoCD to implement CD in Kubernetes Cluster.
2. Implement Datahub to store metadata in each process.
3. Deploy Github Actions runner inside Kubernetes Cluster.
