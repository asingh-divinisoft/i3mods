conda create -n jupy -c conda-forge jupyterlab jupytext -y
conda create -n web -c conda-forge python ipython ipykernel beautifulsoup4 selenium requests tqdm pandas -y

rustup component add rust-src
#sudo apt install jupyter-notebook cmake build-essential
cargo install evcxr_jupyter
evcxr_jupyter --install
