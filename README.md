# eks-argocd-terraform-infra
Pure full IaaC configuration of EKS and ArgoCD written in Terraform to quickly get GitOps expierence

        .github
        └── workflows
            ├── first-terraform-plan.yml
            └── later-terraform-apply.yml

        core-infra
        └── develop
            ├── acm
            ├── argocd-helm-release
            ├── aws-alb-ctrl
            ├── eks-insights
            ├── eks-ocean-cluster
            ├── iam-oidc
            ├── iam-spotinst
            ├── s3-backend
            └── vpc

        argocd-config
        └── develop
            ├── aws-r53-records
            ├── gitops-apps
            └── s3-backend

        modules
        ├── acm
        ├── argocd-config
        ├── argocd-helm-release
        ├── aws-alb-ctrl
        ├── aws-eks-cluster
        ├── aws-eks-insights
        ├── aws-r53-records
        ├── data-vpc
        ├── iam-spotinst
        ├── s3-backend
        ├── spotinst-eks-ocean
        ├── spotinst-ocean-controller
        └── vpc