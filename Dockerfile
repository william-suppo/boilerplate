FROM williamsuppo/php:8.1 as base

ARG WWW_USER=1000
ARG WWW_GROUP=1000
ARG WORKING_DIR=/app

# Copy source code
COPY --chown=${WWW_USER}:${WWW_GROUP} . ${WORKING_DIR}

FROM base as build

USER webapp

# Install composer dependencies
RUN composer install

# Install npm dependencies
RUN npm ci

# Build assets
RUN npm run prod

FROM base as prod

ARG WWW_USER=1000
ARG WWW_GROUP=1000
ARG WORKING_DIR=/app

COPY --from=build --chown=${WWW_USER}:${WWW_GROUP} ${WORKING_DIR}/public ./public
COPY --from=build --chown=${WWW_USER}:${WWW_GROUP} ${WORKING_DIR}/vendor ./vendor
