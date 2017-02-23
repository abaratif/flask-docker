FROM alpine 

# Set proxy url
ENV http_proxy  = ""
ENV https_proxy = ""
 
# Install packages via alpine package manager
RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    rm -r /root/.cache


# Copy over files
COPY . . 
WORKDIR . 

# Install packages and run app
RUN pip install -r requirements.txt
ENTRYPOINT ["python3"]
CMD ["run.py"]
EXPOSE 5000
