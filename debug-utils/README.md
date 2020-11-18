### How-to:

1. Create the file `debug-utils-sidecard.yaml` for patching deployment.
   ```
    spec:
      template:
        spec:
          shareProcessNamespace: true
          containers:
          - name: debug-utils
            image: <image> 
            imagePullPolicy: Always
            command: ['/bin/sleep', 'infinty']
   ```

2. Patch deployment to add debug-utils container as a sidecar for debugging.
   ```
   kubectl patch deployment <deployment> -p "$(< debug-utils-sidecar.yaml)"
   ```
3. Exec into pod:
   ``` 
   kubectl exec <pod> -it -c debug-utils -- zsh
   ```
4. Undo the patch:
   ```
   kubectl rollout undo deployment <deployment>
   ```
