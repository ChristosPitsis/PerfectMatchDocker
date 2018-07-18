FROM alpine/git
WORKDIR /myapp
RUN git clone https://github.com/ChristosPitsis/PerfectMatchHelper.git

# specify the node base image with your desired version node:<version>
FROM node:8
WORKDIR /myapp
COPY --from=0 /myapp/PerfectMatchHelper /myapp
# replace this with your application's default port
EXPOSE 8081
RUN \
	npm install --save fs && \
	npm install --save util && \
	npm install --save libxmljs && \
	npm install --save jsonschema && \
	npm install --save express && \
	npm install --save xmlbuilder && \
	npm install --save body-parser && \
	npm install --save express-xml-bodyparser && \
	npm install --save xmlhttprequest && \
	npm install --save xml2json

CMD nodejs server.js
