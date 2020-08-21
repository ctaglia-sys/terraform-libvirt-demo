#cloud-config
# vim: syntax=yaml
#
# ***********************
# 	---- for more examples look at: ------
# ---> https://cloudinit.readthedocs.io/en/latest/topics/examples.html
# ******************************
#
# This is the configuration syntax that the write_files module
# will know how to understand. encoding can be given b64 or gzip or (gz+b64).
# The content will be decoded accordingly and then written to the path that is
# provided.
#
# Note: Content strings here are truncated for example purposes.
ssh_pwauth: True
#chpasswd:
#  list: |
#     root: StrongPassword
#  expire: False

users:
  - name: root
    ssh_authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCycJ9LpZL06/AaisGgERw3PcgZibBktgwRCIy6XI0c7JRVH1JFOV+bIYwY81On+OOTGdVZnHt5tgDFkq0mOpzxdCTX/3SQGllw8hHia3BMTiYSJn/Mf/nvb5jghyeCuI91rMiTlacF2YtM8DCNiAbmcx4zXKzuGb6TT3xs7ZOC14nP//M68K6UVTSu0jOCBSRcp/PDGsMvRhqfgt5Phd6CckLCfBSQXlJQbFNrho6r8E3Xmfxi4VfB/pcDsbuU6DjL/rkHYbs/M0iOoKgQWruiEtWnsZvsSnJWr6oulrzWmeFH7GHM+L10aC4QrzYP3wVMO5UQYQGsj1RGkliOnkoxJLvaLqZPKxAoqPFh+AVA3kpQPd0H1Ckc+BjfBVfLyHdjD61lRY2EAB/hbr3RliYLD3Q3WJQ2PYdriAj7aKfuTfC0XVQg6si1k7mfLrDVETHEfx5ClhRcqdm8ppXwFLuo0LUxQK2PMJGNQUD0j44ArzNvVnsK3s55AfUWk5PQ8gk=
    shell: /bin/bash
    groups: wheel