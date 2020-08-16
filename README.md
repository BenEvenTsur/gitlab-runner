Login to Rancher:
    rancher login $RANCHER_URL --token $BEARER_TOKEN --context $PROJECT_ID --skip-verify
Switch between projects inside the cluster:
    rancher context switch
Get all deployments:
    rancher kubectl get all
Create new deployment by YAML file:
    rancher kubectl create -f $YAML_FILE
Delete existing deployment:
    rancher kubectl delete -f $YAML_FILE
Update existing deployment:
    rancher kubectl apply -f $YAML_FILE
    * this command create the deployment if not exist.

Environments Information:
    RANCHER_URL - url address of rancher website private instance.
    PROJECT_ID - after navigate the project in rancher website you can find the project id in the url address: https://.../v3/cluster/[PROJECT_ID]/namespace/...
    BEARER_TOKEN - in rancher website press on your right-top user icon -> 'API & Keys' -> Add key -> Create, then you can see the bearer token.
    YAML_FILE - path to the k8s deployment YAML file.