# Отчёт по результатам анализа Kubernetes Audit Log

## Подозрительные события

1. Доступ к секретам:
   - Кто: minikube-user
   - Где: /api/v1/namespaces/kube-system/secrets?limit=500
   - Почему подозрительно: secrets is forbidden: User \"system:serviceaccount:secure-ops:monitoring\" cannot list resource \"secrets\" in API group \"\" in the namespace \"kube-system\"

2. Привилегированные поды:
   - Кто: minikube-user
   - Комментарий: Создание привилегированного пода с флагом "privileged": true

3. Использование kubectl exec в чужом поде:
   - Кто: system:node:minikube
   - Что делал: Пытался прочитать данные подов containers with unready status: [coredns]

4. Создание RoleBinding с правами cluster-admin:
   - Кто: system:serviceaccount:kube-system:service-account-controller
   - К чему привело: RBAC: allowed by ClusterRoleBinding \"system:controller:service-account-controller\" of ClusterRole \"system:controller:service-account-controller\" to ServiceAccount \"service-account-controller/kube-system\"

5. Удаление audit-policy.yaml:
   - Кто: minikube-user
   - Возможные последствия: Может привести к потере важных событий аудита

## Вывод

По логу аудита можно восстановить последовательность событий и обнаружить подозрительную активность 
