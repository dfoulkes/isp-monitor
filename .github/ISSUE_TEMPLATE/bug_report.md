---
name: Bug report
about: Report an issue.
title: ''
labels: ''
assignees: ''

---

**Describe the bug**
A clear and concise description of what the bug is. Please do not use an Issue to ask for help deploying the stack in the cluster. Troubleshoot your cluster configuration first.

**Troubleshooting**

1. There's a hard assumption you're running a k3s cluster.
2. Are all pods in "Running" state? If any is in CrashLoopback or Error, check it's logs.
3. You cluster already works with other applications that have HTTP/HTTPS? If not, first deploy an example NGINX and test it's access thru the created URL.
4. have you tried with persistence disabled?, does your cluster already provides persistent storage (PVs) to other applications?
5. If you deployed the speed-monitoring stack and some targets are not available or showing no metrics in Grafana, make sure you don't have IPTables rules or use a firewall on your nodes before deploying Kubernetes.

**Customizations**

1. Did you customize `vars.jsonnet`? Put the contents below:

```jsonnet
# vars.jsonnet content
```

2. Did you change any other file? Put the contents below:

```jsonnet
# file x.yz content
```

**What did you see when trying to access Grafana and Prometheus web GUI**
A clear and concise description with screenshots from the URLs and logs from the pods.

**Additional context**
Add any other context about the problem here.
