package com.xyauto.qa.util.cache;

import java.util.List;
import java.util.Set;

public interface ICacheService {

    public boolean set(final String key, String value);

    public boolean set(final String key, String value, Long expireTime);
    
    public boolean setnx(final String key, String value, Long expireTime);

    public void remove(final String... keys);

    public void removePattern(final String pattern);

    public void remove(final String key);

    public boolean exists(final String key);

    public String get(final String key);

    public void hmSet(String key, String hashKey, String value);

    public String hmGet(String key, String hashKey);

    public void lPush(String k, String v);

    public List<String> lRange(String k, long l, long l1);

    public void add(String key, String value);

    public Set<String> setMembers(String key);

    public void zAdd(String key, String value, double score);

    public Set<String> rangeByScore(String key, double score, double score1);

    public int keys_count(final String key);
    
    public long ttl(String key);

}
