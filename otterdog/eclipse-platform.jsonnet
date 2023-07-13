local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-platform') {
  settings+: {
    billing_email: "webmaster@eclipse.org",
    blog: "https://www.eclipse.org/eclipse/",
    default_repository_permission: "none",
    default_workflow_permissions: "write",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Eclipse Platform is a framework for rich client applications in Java, powering the Eclipse IDE and other toolsets",
    email: "platform-dev@eclipse.org",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: true,
    members_can_delete_repositories: true,
    name: "Eclipse Platform",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    twitter_username: "EclipseJavaIDE",
    two_factor_requirement: false,
    web_commit_signoff_required: false,
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/platform/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: false,
      description: "Common contribution content for eclipse-platform repositories",
      has_discussions: true,
      has_projects: false,
      homepage: "https://www.eclipse.org/eclipse/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "eclipse"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('eclipse.platform') {
      allow_merge_commit: false,
      default_branch: "master",
      has_discussions: true,
      homepage: "https://www.eclipse.org/eclipse/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "eclipse",
        "java"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.common') {
      allow_merge_commit: false,
      default_branch: "master",
      dependabot_alerts_enabled: false,
      has_projects: false,
      has_wiki: false,
      homepage: "https://www.eclipse.org/eclipse",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          bypass_pull_request_allowances+: [
            "@eclipse-releng-bot"
          ],
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          bypass_pull_request_allowances+: [
            "@eclipse-releng-bot"
          ],
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.debug') {
      allow_merge_commit: false,
      default_branch: "master",
      description: "Eclipse Platform Debug functionality",
      has_projects: false,
      has_wiki: false,
      homepage: "https://www.eclipse.org/eclipse/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "debug",
        "eclipse",
        "ide",
        "java"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.images') {
      allow_merge_commit: false,
      default_branch: "master",
      dependabot_alerts_enabled: false,
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.releng') {
      allow_merge_commit: false,
      default_branch: "master",
      dependabot_alerts_enabled: false,
      has_discussions: true,
      has_projects: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.releng.aggregator') {
      allow_merge_commit: false,
      default_branch: "master",
      dependabot_alerts_enabled: false,
      description: "Aggregated repository for Eclipse Java IDE",
      has_discussions: true,
      has_projects: false,
      has_wiki: false,
      homepage: "https://www.eclipse.org/eclipse/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "eclipse",
        "ide",
        "java"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://ci.eclipse.org/releng/github-webhook/') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('ECLIPSE_GITLAB_API_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          bypass_pull_request_allowances+: [
            "@eclipse-releng-bot"
          ],
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          bypass_pull_request_allowances+: [
            "@eclipse-releng-bot"
          ],
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.releng.buildtools') {
      allow_merge_commit: false,
      default_branch: "master",
      dependabot_alerts_enabled: false,
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.resources') {
      allow_merge_commit: false,
      default_branch: "master",
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          bypass_pull_request_allowances+: [
            "@eclipse-releng-bot"
          ],
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.runtime') {
      allow_merge_commit: false,
      default_branch: "master",
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.swt') {
      allow_merge_commit: false,
      default_branch: "master",
      description: "Eclipse SWT",
      has_discussions: true,
      has_projects: false,
      homepage: "https://www.eclipse.org/swt/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "cross-platform-gui",
        "eclipse",
        "java",
        "swt",
        "ui"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://ci.eclipse.org/releng/github-webhook/') {
          events+: [
            "pull_request",
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('GIST_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          bypass_pull_request_allowances+: [
            "@eclipse-releng-bot"
          ],
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          bypass_pull_request_allowances+: [
            "@eclipse-releng-bot"
          ],
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.swt.binaries') {
      allow_merge_commit: false,
      default_branch: "master",
      description: "Eclipse SWT",
      has_projects: false,
      has_wiki: false,
      homepage: "https://www.eclipse.org/swt/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          bypass_pull_request_allowances+: [
            "@eclipse-releng-bot"
          ],
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          bypass_pull_request_allowances+: [
            "@eclipse-releng-bot"
          ],
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.team') {
      allow_merge_commit: false,
      default_branch: "master",
      dependabot_alerts_enabled: false,
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.text') {
      allow_merge_commit: false,
      default_branch: "master",
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.ua') {
      allow_merge_commit: false,
      default_branch: "master",
      dependabot_alerts_enabled: false,
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.ui') {
      allow_auto_merge: true,
      allow_merge_commit: false,
      default_branch: "master",
      description: "Eclipse Platform",
      has_discussions: true,
      has_projects: false,
      has_wiki: false,
      homepage: "https://projects.eclipse.org/projects/eclipse.platform",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "eclipse",
        "gui",
        "java",
        "osgi",
        "rcp",
        "swt"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.platform.ui.tools') {
      allow_merge_commit: false,
      default_branch: "master",
      dependabot_alerts_enabled: false,
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('ui-best-practices') {
      allow_merge_commit: false,
      description: "UI Best Practices for the Eclipse IDE",
      has_discussions: true,
      homepage: "https://eclipse-platform.github.io/ui-best-practices/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('www.eclipse.org-eclipse') {
      allow_merge_commit: false,
      default_branch: "master",
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://ci.eclipse.org/releng/github-webhook/') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('www.eclipse.org-eclipse-news') {
      allow_merge_commit: false,
      default_branch: "master",
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://ci.eclipse.org/releng/github-webhook/') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('www.eclipse.org-swt') {
      default_branch: "master",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
  ],
}
