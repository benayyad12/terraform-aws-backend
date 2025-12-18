## Architecture — backend-terraform

Copiez ce fichier et ouvrez-le avec l'extension **Markdown Preview Enhanced** (ou n'importe quelle extension Mermaid compatible) dans VS Code pour l'aperçu et l'export.

```mermaid
flowchart LR
  subgraph Repo["Repository: backend-terraform"]
    direction TB
    Root[main.tf (root module)]
    Root --> M_s3[modules/s3]
    Root --> M_dynamodb[modules/dynamodb]
    Examples[examples/basic<br/>README.md]
  end

  subgraph AWS["AWS"]
    direction TB
    S3[S3 Bucket<br/>(tfstate)]
    DDB[DynamoDB Table<br/>(state lock)]
  end

  subgraph CI["GitHub Actions"]
    direction TB
    Workflow[.github/workflows/terraform.yml<br/>(fmt / init / validate)]
    Runner[self-hosted runner<br/>(actions-runner)]
  end

  M_s3 -->|crée| S3
  M_dynamodb -->|crée| DDB

  Workflow -->|s'exécute sur| Runner
  Runner -->|exécute| Workflow
  Workflow -->|commande| Fmt["terraform fmt -check -recursive"]
  Workflow -->|commande| Validate["terraform init -backend=false && terraform validate"]

  Repo -->|module source| Workflow
  Repo -->|exemple d'usage| Examples

  classDef aws fill:#f8f0e3,stroke:#d6a33a;
  class S3,DDB aws;
  classDef repo fill:#eef6ff,stroke:#4a90e2;
  class Repo,Root,Examples repo;
  class CI,Workflow,Runner repo;
```

---

Usage rapide dans VS Code:
- Installer l'extension `Markdown Preview Enhanced` (shd101wyy.markdown-preview-enhanced).
- Ouvrir `docs/architecture.md` et lancer `Markdown Preview Enhanced: Open Preview to the Side` depuis la palette de commandes.
- Pour exporter en PNG/SVG: `Markdown Preview Enhanced: Export (PNG)` ou `Export (SVG)`.
