FROM gitpod/workspace-full:latest

RUN sudo install-packages expect

# Download and prepare latest cli wallet
RUN wget -c https://github.com/iotaledger/cli-wallet/releases/download/v1.0.0-rc.2/wallet-linux -O ~/.local/bin/wallet
RUN chmod +x ~/.local/bin/wallet

RUN git clone https://github.com/Dr-Electron/shimmer-wallet.rs-python-cde-poc && \
    cp -r shimmer-wallet.rs-python-cde-poc/.scripts scripts && rm -rf shimmer-wallet.rs-python-cde-poc
RUN chmod +x scripts/*.exp

# Install python lib
RUN pip install setuptools-rust && \
    git clone https://github.com/iotaledger/wallet.rs && \
    cd wallet.rs/bindings/python && \
    pip install -r requirements-dev.txt && \
    pip install .

# Return to home and cleanup workspace
RUN cd && rm -rf wallet.rs
