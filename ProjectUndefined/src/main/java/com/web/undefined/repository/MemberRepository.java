package com.web.undefined.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.web.undefined.entity.Member;


public interface MemberRepository extends JpaRepository<Member,String>{

//	Member findOne(String username);


}
