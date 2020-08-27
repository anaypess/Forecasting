conda create --name forecasting
conda activate forecasting
conda install -c conda-forge -c pytorch pip fbprophet pytorch
pip install u8darts
conda install -c anaconda ipykernel
python -m ipykernel install --user --name=forecasting
