package com.rays.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rays.common.BaseDAOImpl;
import com.rays.common.UserContext;
import com.rays.common.attachment.AttachmentDAOInt;
import com.rays.common.attachment.AttachmentDTO;
import com.rays.dto.RoleDTO;
import com.rays.dto.UserDTO;

/**
 * Contains User CRUD operations
 * 
 * Rajat Dhakad
 *
 */
@Repository
public class UserDAOImpl extends BaseDAOImpl<UserDTO> implements UserDAOInt {

	@Autowired
	public AttachmentDAOInt attachmentService;

	@Override
	public Class<UserDTO> getDTOClass() {
		return UserDTO.class;
	}

	@Override
	protected List<Predicate> getWhereClause(UserDTO dto, CriteriaBuilder builder, Root<UserDTO> qRoot) {

		// Create where conditions
		List<Predicate> whereCondition = new ArrayList<Predicate>();

		if (!isEmptyString(dto.getFirstName())) {

			whereCondition.add(builder.like(qRoot.get("firstName"), dto.getFirstName() + "%"));
		}

		if (!isEmptyString(dto.getRoleName())) {

			System.out.println("role name ________"+ dto.getRoleName());
			whereCondition.add(builder.like(qRoot.get("roleName"), dto.getRoleName() + "%"));
		}
		if (!isEmptyString(dto.getLoginId())) {

			whereCondition.add(builder.equal(qRoot.get("loginId"), dto.getLoginId()));
		}
		if (!isEmptyString(dto.getPassword())) {

			whereCondition.add(builder.equal(qRoot.get("password"), dto.getPassword()));
		}

		if (!isEmptyString(dto.getStatus())) {

			whereCondition.add(builder.equal(qRoot.get("status"), dto.getStatus()));
		}

		if (!isZeroNumber(dto.getRoleId())) {
			System.out.println("roleid123   " + dto.getRoleId());
			System.out.println("roleidname   " + dto.getRoleName());

			whereCondition.add(builder.equal(qRoot.get("roleId"), dto.getRoleId()));
		}

		if (isNotNull(dto.getDob())) {
			System.out.println("search for dob " + dto.getDob());
			whereCondition.add(builder.equal(qRoot.get("dob"), dto.getDob()));
			
		}

		return whereCondition;
	}

	@Autowired
	RoleDAOInt roleDao;

	@Override
	protected void populate(UserDTO dto, UserContext userContext) {
		if (dto.getRoleId() != null && dto.getRoleId() > 0) {
			RoleDTO roleDto = roleDao.findByPK(dto.getRoleId(), userContext);
			dto.setRoleName(roleDto.getName());
			System.out.println(dto.getRoleName() + " <<< is RoleName set in userdao populate");
		}
		if (dto.getId() != null && dto.getId() > 0) {
			UserDTO userData = findByPK(dto.getId(), userContext);
			dto.setImageId(userData.getImageId());
			System.out.println(dto.getImageId() + " image id in userdao papulate method");
		}
	}

	public void delete(UserDTO dto, UserContext userContext) {
		super.delete(dto, userContext);
		Long id = dto.getImageId();
		if(id == null) {
			return;
		} else {
		System.out.println("userdaoimpl me image delete " + id);
		AttachmentDTO attachmentDto = attachmentService.findByPK(id, userContext);
		attachmentService.delete(attachmentDto, userContext);
		}
	}

	@Override
	public UserDTO findByEmail(String attribute, String val, UserContext userContext) {
		Class<UserDTO> dtoClass = getDTOClass();

		CriteriaBuilder builder = entityManager.getCriteriaBuilder();
		System.out.println(val + "----->>>>>userDao");
		CriteriaQuery<UserDTO> cq = builder.createQuery(dtoClass);

		Root<UserDTO> qRoot = cq.from(dtoClass);

		Predicate condition = builder.equal(qRoot.get(attribute), val);

		if (userContext != null && !isZeroNumber(userContext.getOrgId())) {
			Predicate conditionGrp = builder.equal(qRoot.get("orgId"), userContext.getOrgId());
			cq.where(condition, conditionGrp);
		} else {
			cq.where(condition);
		}
		System.out.println(cq + "Query created in user dao");
		TypedQuery<UserDTO> query = entityManager.createQuery(cq);

		List<UserDTO> list = query.getResultList();

		UserDTO dto = null;

		if (list != null && !list.isEmpty()) {
			System.out.println(list.get(0) + "list------");
			dto = list.get(0);
			System.out.println(dto.getLoginId() + "Login iid get from db in userDao");
		}
		System.out.println("going to return dto");
		return dto;

	}

}
