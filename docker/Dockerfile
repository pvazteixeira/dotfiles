FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# Prereqs a real host would already have (the manual "apt install ansible git"
# step), plus sudo so the playbook's privileged tasks escalate the way they
# would for a normal login user rather than running as root.
RUN apt-get update && apt-get install -y --no-install-recommends \
    ansible \
    curl \
    ca-certificates \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Non-root login user with passwordless sudo, mirroring a freshly provisioned
# host. uid 1000 matches the typical first user so the bind-mounted repo is
# readable. (Passwordless sudo stands in for the interactive --ask-become-pass
# prompt; the ansible -> sudo -> root escalation path is otherwise identical.)
ARG USER=pvt
RUN useradd --create-home --uid 1000 --shell /bin/bash "${USER}" \
    && echo "${USER} ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/${USER}" \
    && chmod 0440 "/etc/sudoers.d/${USER}"

USER ${USER}
WORKDIR /home/${USER}

# Default to a shell; compose overrides this with the bootstrap test script.
CMD ["/bin/bash"]
