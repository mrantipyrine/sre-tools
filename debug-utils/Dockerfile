FROM alpine:3.12.1

# Install packages
RUN apk add --no-cache \
    bash \
    curl \
    drill \
    gettext \
    git \
    htop \
    iftop \
    jq \
    ngrep \
    postgresql-client \
    python3 \
    py-pip \
    redis \
    socat \
    tcpdump \
    zsh \
    linux-tools

# Install custom scripts 
RUN mkdir -p /opt/bin
COPY scripts/* /opt/bin
ENV PATH=/opt/bin:${PATH}

# Install Python packages
COPY /requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt --no-cache-dir

# Install Oh My Zsh
ARG OH_MY_ZSH_VERSION=master
ARG ZSH_AUTOSUGGESTIONS_VERSION=master
RUN git clone --depth 1 --branch ${OH_MY_ZSH_VERSION} --single-branch \
    https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN git clone --depth 1 --branch ${ZSH_AUTOSUGGESTIONS_VERSION} --single-branch \
    https://github.com/zsh-users/zsh-autosuggestions \
    ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN mkdir -p ~/.oh-my-zsh/completions
COPY /docker/zsh/zshrc /root/.zshrc
COPY /docker/zsh/debug-utils.plugin.zsh /root/.oh-my-zsh/custom/plugins/debug-utils/
COPY /docker/zsh/debug-utils.zsh-theme /root/.oh-my-zsh/custom/themes/

CMD ["/bin/zsh"]

