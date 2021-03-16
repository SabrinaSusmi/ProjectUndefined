package com.web.undefined.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.web.undefined.entity.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member,String>{

}
