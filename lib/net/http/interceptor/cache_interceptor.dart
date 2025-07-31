import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

DioCacheInterceptor cacheInterceptor = DioCacheInterceptor(
  options: CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.request,
    hitCacheOnErrorCodes: const [500],
    hitCacheOnNetworkFailure: true,
    maxStale: const Duration(days: 1),
    priority: CachePriority.normal,
    cipher: null,
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    allowPostMethod: false,
  ),
);
